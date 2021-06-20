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
('まさ#2624','masatama83','masa83_poke','Masahide Tamaki','まさ','JP','pikuchanneru','pikuchanneru'),
('我借酒逃避现实#9966','657582878',NULL,'Ai Yuqing','风音花鸣','CN','pikuchanneru','pikuchanneru'),
('XerxesKhan11#7660','ahymadouble22','apexdeoxys',NULL,'Sapphire','NZ','pikuchanneru','pikuchanneru'),
('z0mog#9051','z0mog','z0mogvgc','Ryan Haig','z0mog','US','pikuchanneru','pikuchanneru'),
('Benthejamin56#5766','benthejamin56','benthejamin56',NULL,'BTJ56','GB','pikuchanneru','pikuchanneru'),
('Íkar#5984','ikar','Ikar_cc','Matthew ','Íkar','PL','pikuchanneru','pikuchanneru'),
('Phamton Evil#5804','phamton-kelvin-herrera-farenheit','PhamtonEvil','Alan Kevin','Phamton Evil','MX','pikuchanneru','pikuchanneru'),
('arekusabi#2525','alexavieralvar3','AlexavierAlvar3','Alexavier Alvarez','Arekusabi','PR','pikuchanneru','pikuchanneru'),
('Sniperman2#1581','sniperman2',NULL,NULL,'Patrick','AU','pikuchanneru','pikuchanneru'),
('rfrdaus#5854','rfrdaus',NULL,'Rizki Firdaus','Rizki','ID','pikuchanneru','pikuchanneru'),
('Hoàng Hồ Hữu (PetPoke)#3563','petpokeno1','pet_poke','Hoang Huu Ho','SodiumPet','VN','pikuchanneru','pikuchanneru'),
('打滾飯糰#8763','otenkoz','OtenkozVGC','Michael Lee','帕帕拉','TW','pikuchanneru','pikuchanneru'),
('turjo27#2238','turjo27',NULL,'Mashrur Turjo','turjo','BD','pikuchanneru','pikuchanneru'),
('juvent#5269','juventiawu',NULL,'Juventia Wu','Juventia','ID','pikuchanneru','pikuchanneru'),
('faquinche#8480','faquinche','8ytes','Fabián Quinche','ce3olla','EC','pikuchanneru','pikuchanneru'),
('partypoison94#5288','ubiquistore-1','honeymoononice','Muhammad Hafidz Syahril','MHS (1/f)','ID','pikuchanneru','pikuchanneru'),
('tomcheung22#1346','tomcheung71','tomcheung22','Cheung Man Fung','Serena','HK','pikuchanneru','pikuchanneru'),
('Lonk#0001','glong279','Odin_Mk2','Lê Gia Long','Glenn','VN','pikuchanneru','pikuchanneru'),
('Melvilicious#5204','melvin-concepcion','melvilicious','Melvin Concepción Gómez','Melvilicious','PR','pikuchanneru','pikuchanneru'),
('Yukino#5805','276258550',NULL,NULL,'落花人独立','CN','pikuchanneru','pikuchanneru'),
('Poke fey#6627','pokefey','pokefey','Ángel','Fey','ES','pikuchanneru','pikuchanneru'),
('Angelohunter#5764','angelohunter','_collins12','Angelo','Angelo','US','pikuchanneru','pikuchanneru')
    
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