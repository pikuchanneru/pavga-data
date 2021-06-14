INSERT INTO
    trainer (
        id,
        twitter
    )
VALUES
(44,'anabelvg_21')
    
     ON CONFLICT (id) DO
UPDATE
SET
    twitter = EXCLUDED.twitter;

INSERT INTO
    trainer (
        id,
        realname
    )
VALUES
(77,'Kisch Cheng'),
(55,'Dali Sebastian Putra Noviyanto')
    
     ON CONFLICT (id) DO
UPDATE
SET
    realname = EXCLUDED.realname;