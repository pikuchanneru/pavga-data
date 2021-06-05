CREATE TABLE standing (
    id BIGSERIAL NOT NULL PRIMARY KEY
    ,tournament_id BIGINT NOT NULL
    ,trainer_id BIGINT NOT NULL
    ,team VARCHAR[] NOT NULL
    ,team_super VARCHAR[]
    ,two_one BIGINT NOT NULL DEFAULT 0
    ,two_nil BIGINT NOT NULL DEFAULT 0
    ,one_two BIGINT NOT NULL DEFAULT 0
    ,nil_two BIGINT NOT NULL DEFAULT 0
    ,double_loss BIGINT NOT NULL DEFAULT 0
    ,bye BIGINT NOT NULL DEFAULT 0
    ,draw BIGINT NOT NULL DEFAULT 0
    ,swiss BIGINT NOT NULL
    ,dnf BOOLEAN NOT NULL DEFAULT FALSE
    ,finish BIGINT
    ,point_award BIGINT NOT NULL
    ,prize_award DOUBLE PRECISION
    ,prize_currency VARCHAR
    ,created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
    ,updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
    ,created_by VARCHAR NOT NULL
    ,updated_by VARCHAR NOT NULL

    ,CONSTRAINT fk_tournament
      FOREIGN KEY(tournament_id) 
	  REFERENCES tournament(id)

    ,CONSTRAINT fk_trainer
      FOREIGN KEY(trainer_id) 
	  REFERENCES trainer(id)
);