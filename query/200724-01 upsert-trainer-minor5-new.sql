INSERT INTO
    trainer (
        discord,
        battlefy,
        twitter,
        realname,
        nickname,
        country,
        created_by,
        updated_by
    )
VALUES

('@RedX#5837','narugrenlio','Julio34698377','Julio Rivas Jiménez','Julio','MX','pikuchanneru','pikuchanneru'),
('小德贝贝#2685','小德贝贝',NULL,NULL,'小德贝贝','CN','pikuchanneru','pikuchanneru'),
('Val16#9245','val16','Val13905999','Valerio','Val','IT','pikuchanneru','pikuchanneru')
    
     ON CONFLICT (id) DO
UPDATE
SET
    discord = EXCLUDED.discord,
    battlefy = EXCLUDED.battlefy,
    twitter = EXCLUDED.twitter,
    realname = EXCLUDED.realname,
    nickname = EXCLUDED.nickname,
    country = EXCLUDED.country,
    created_by = EXCLUDED.created_by,
    updated_by = EXCLUDED.updated_by;