from flask import Flask, request, jsonify
import sqlite3

from .audit import append_audit

app = Flask(__name__)


def get_db():
    conn = sqlite3.connect("novara.db")
    conn.row_factory = sqlite3.Row
    return conn


@app.route("/notes/create", methods=["POST"])
def create_note():
    data = request.get_json() or {}
    title = data.get("title", "")
    content = data.get("content", "")

    conn = get_db()
    cur = conn.cursor()

    try:
        # 1. 通常のノート作成
        cur.execute(
            "INSERT INTO notes (title, content) VALUES (?, ?)",
            (title, content),
        )
        note_id = cur.lastrowid

        # 2. 文明OSのログに刻む
        audit_hash = append_audit(
            conn,
            actor="hinata",          # あとでユーザーIDに変える
            action="create_note",
            entity_type="note",
            entity_id=note_id,
            payload={
                "title_length": len(title),
                "content_preview": content[:20],
            },
        )

        conn.commit()
    except Exception as e:
        conn.rollback()
        return jsonify({"error": str(e)}), 500
    finally:
        conn.close()

    return jsonify(
        {"status": "ok", "note_id": note_id, "audit_hash": audit_hash}
    ), 201