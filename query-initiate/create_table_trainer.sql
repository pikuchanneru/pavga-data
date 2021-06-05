CREATE TABLE trainer (
    id BIGSERIAL NOT NULL PRIMARY KEY
    ,discord VARCHAR NOT NULL
    ,battlefy VARCHAR NOT NULL
    ,twitter VARCHAR
    ,realname VARCHAR
    ,nickname VARCHAR NOT NULL
    ,country VARCHAR NOT NULL
    ,created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
    ,updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
    ,created_by VARCHAR NOT NULL
    ,updated_by VARCHAR NOT NULL
);