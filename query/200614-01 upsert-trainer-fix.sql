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
(10,'Gin #7889','ginjr','gipaarrr','Muhammad Ghivar Arrofi','Gin','ID','pikuchanneru','pikuchanneru'),
(44,'Mkh#3748','alvinsoyol','anabelvg_21','Mak Kwan Ho','AnabelVg','HK','pikuchanneru','pikuchanneru'),
(77,'Kassiddy#0974','kischnp','Kassiddy_VGC','Kisch Cheng','Kassiddy','HK','pikuchanneru','pikuchanneru'),
(55,'IBOIII#1111','dalisebastian06','notIBOIII','Dali Sebastian Putra Noviyanto','IBOIII','ID','pikuchanneru','pikuchanneru'),
(5,'blank#1264','giolozanooumwa',NULL,'Patrick Santos','Gio (Patrick Santos)','PH','pikuchanneru','pikuchanneru'),
(41,'洛觞#1925','2517534808',NULL,'Lou Shang','洛觞','CN','pikuchanneru','pikuchanneru')
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