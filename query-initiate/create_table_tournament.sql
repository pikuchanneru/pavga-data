CREATE TABLE tournament (
    id BIGINT NOT NULL PRIMARY KEY
    ,tier VARCHAR NOT NULL
    ,title VARCHAR NOT NULL
    ,headcount BIGINT NOT NULL
    ,start_date TIMESTAMPTZ NOT NULL
    ,end_date TIMESTAMPTZ NOT NULL
    ,battlefy VARCHAR NOT NULL
    ,created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
    ,updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
    ,created_by VARCHAR NOT NULL
    ,updated_by VARCHAR NOT NULL
);