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
('BeltranJr#0130','agustin-caro-1','agusmbc','Agustín Beltrán','BeltránJr','ES','pikuchanneru','pikuchanneru'),
('Dot1Q#0333','dot1q_vgc','Dot1Q_VGC','Christian De Nicolo','Dot1Q','IT','pikuchanneru','pikuchanneru'),
('Kyogre SG#7815','toumakazusa1st','NULL','NULL','イリン★','CN','pikuchanneru','pikuchanneru'),
('isbryanooo_#5628','bryancyh','akameoneesan','NULL','Bryan','MY','pikuchanneru','pikuchanneru'),
('Pharitto #1584','pharittovg','NULL','NULL','Pharitt','TH','pikuchanneru','pikuchanneru')
    
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