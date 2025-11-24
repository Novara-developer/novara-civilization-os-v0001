import json
import hashlib
import datetime
import sqlite3


def canonical_json(obj):
    """Same dict -> same string. Keys sorted, no extra spaces."""
    return json.dumps(obj or {}, sort_keys=True, separators=(",", ":"))


def append_audit(conn, *, actor, action,
                 entity_type=None, entity_id=None, payload=None):
    """
    Append one audit event into audit_events with a hash chain.

    - conn: sqlite3.Connection
    - actor: 'hinata', 'system', 'novara_ai', ...
    - action: 'create_note', 'llm_inference', ...
    """
    cur = conn.cursor()

    # 1. get previous hash (tail of the chain)
    cur.execute("SELECT hash FROM audit_events ORDER BY id DESC LIMIT 1")
    row = cur.fetchone()
    prev_hash = row[0] if row else "GENESIS_BLOCK_NOVARA_V0"

    # 2. metadata
    created_at = datetime.datetime.utcnow().isoformat() + "Z"
    payload_json = canonical_json(payload)

    # 3. compute current hash
    raw = f"{prev_hash}{created_at}{actor}{action}{payload_json}"
    current_hash = hashlib.sha256(raw.encode("utf-8")).hexdigest()

    # 4. insert
    cur.execute(
        """
        INSERT INTO audit_events
          (created_at, actor, action, entity_type, entity_id,
           payload_json, prev_hash, hash)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        """,
        (
            created_at,
            actor,
            action,
            entity_type,
            str(entity_id) if entity_id is not None else None,
            payload_json,
            prev_hash,
            current_hash,
        ),
    )

    # commit は呼び出し側でやる想定
    return current_hash