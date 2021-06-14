INSERT INTO
    trainer (
        id,
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
(44,'Mkh#3748','alvinsoyol','anabelvg_21','Mak Kwan Ho','AnabelVg','HK','pikuchanneru','pikuchanneru'),
(77,'Kassiddy#0974','kischnp','Kassiddy_VGC','Kisch Cheng','Kassiddy','HK','pikuchanneru','pikuchanneru'),
(55,'IBOIII#1111','dalisebastian06','notIBOIII','Dali Sebastian Putra Noviyanto','IBOIII','ID','pikuchanneru','pikuchanneru')
    
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