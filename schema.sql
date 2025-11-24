-- Civilization OS v0.0001 - DB Kernel
-- Author: Hinata (GitHub: YOUR_GITHUB_USERNAME)
-- Created: 2025-11-24 (UTC)
-- Purpose:
--   This schema defines the "immutable core" for Novara / Civilization OS.
--   audit_events: append-only ledger of all important actions
--   self_contracts: rules that can even constrain the creator (kill-switch seeds)

PRAGMA foreign_keys = ON;

-- ==========================================
-- 0. Example Domain Table (notes)
--    あなたのアプリ本体のテーブル。既にあるならここは調整 or 削ってOK。
-- ==========================================

CREATE TABLE IF NOT EXISTS notes (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    title       TEXT NOT NULL,
    content     TEXT NOT NULL,
    created_at  TEXT NOT NULL DEFAULT (datetime('now')),
    updated_at  TEXT NOT NULL DEFAULT (datetime('now'))
);

-- updated_at 自動更新トリガー（任意）
CREATE TRIGGER IF NOT EXISTS notes_set_updated_at
AFTER UPDATE ON notes
BEGIN
    UPDATE notes
    SET updated_at = datetime('now')
    WHERE id = NEW.id;
END;

-- ==========================================
-- 1. Audit Events (The Immutable Ledger)
--    ここが「文明OSの台帳」。更新・削除禁止。
-- ==========================================

CREATE TABLE IF NOT EXISTS audit_events (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    created_at    TEXT NOT NULL,   -- ISO8601 UTC (e.g., 2025-11-24T12:34:56Z)
    actor         TEXT NOT NULL,   -- 'user:hinata', 'system', 'novara_ai', etc.
    action        TEXT NOT NULL,   -- 'create_note', 'llm_inference', 'violation_detected'
    entity_type   TEXT,            -- 'note', 'task', 'contract', ...
    entity_id     TEXT,            -- '1', 'abc123', ...
    payload_json  TEXT NOT NULL,   -- Canonicalized JSON context
    prev_hash     TEXT NOT NULL,   -- Hash of the previous record
    hash          TEXT NOT NULL    -- SHA-256(prev_hash + metadata + payload)
);

-- index（検索用）
CREATE INDEX IF NOT EXISTS idx_audit_events_created_at
    ON audit_events (created_at);

CREATE INDEX IF NOT EXISTS idx_audit_events_actor
    ON audit_events (actor);

CREATE INDEX IF NOT EXISTS idx_audit_events_entity
    ON audit_events (entity_type, entity_id);

-- ==========================================
-- 2. Self Contracts (The Constitution / Kill-Switch Seeds)
--    自分自身を拘束する「ルール」の定義。
-- ==========================================

CREATE TABLE IF NOT EXISTS self_contracts (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    created_at    TEXT NOT NULL,        -- ISO8601 UTC
    name          TEXT NOT NULL,        -- e.g., 'max_daily_study_hours'
    description   TEXT,                 -- 人間向け説明
    condition     TEXT NOT NULL,        -- JSON: { "type": "threshold", "max": 10 }
    severity      TEXT NOT NULL,        -- 'warn', 'block'
    active        INTEGER NOT NULL DEFAULT 1
);

CREATE INDEX IF NOT EXISTS idx_self_contracts_active
    ON self_contracts (active);

-- ==========================================
-- 3. Integrity Triggers (The "Code is Law" Layer)
--    audit_events は append-only。
--    UPDATE / DELETE しようとするとエラーで止まる。
-- ==========================================

CREATE TRIGGER IF NOT EXISTS audit_events_no_update
BEFORE UPDATE ON audit_events
BEGIN
    SELECT RAISE(ABORT,
        'VIOLATION: audit_events is append-only. History cannot be rewritten.');
END;

CREATE TRIGGER IF NOT EXISTS audit_events_no_delete
BEFORE DELETE ON audit_events
BEGIN
    SELECT RAISE(ABORT,
        'VIOLATION: audit_events is append-only. History cannot be erased.');
END;

-- ==========================================
-- 4. (Optional / Future) Daily Root Hashes
--    将来、1日分のログをまとめて外部アンカーに出す時のためのテーブル。
-- ==========================================

CREATE TABLE IF NOT EXISTS daily_roots (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    date          TEXT NOT NULL,        -- '2025-11-24'
    root_hash     TEXT NOT NULL,        -- ハッシュ値
    created_at    TEXT NOT NULL         -- 作成時刻
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_daily_roots_date
    ON daily_roots (date);
