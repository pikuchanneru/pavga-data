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
(3,'Bahamuth#6605','danieljonathan97','MDanielJonathan','Daniel Jonathan','Bahamuth','ID','pikuchanneru','pikuchanneru'),
(10,'Gin#7889','ginjr','gipaarrr','Muhammad Ghivar Arrofi','Gin','ID','pikuchanneru','pikuchanneru'),
(20,'Mr.PokÉnjoy#8551','unknown5bc1393935b6fd03bd1d63fb','Mr_PokEnjoy','Luka Del Medico','Mr.PokÉnjoy','IT','pikuchanneru','pikuchanneru'),
(21,'nanoooooo#4580','purplemecf','NULL','Andy Willyanto Lim','Nanoooooo','ID','pikuchanneru','pikuchanneru'),
(23,'pikuchanneru#0277','pikuchanneru','pikuchanneru','Taufik Wiradarmo','Nadzuna','ID','pikuchanneru','pikuchanneru'),
(26,'Roversombra#2603','earaaguaron','roversombra','NULL','Roversombra','ES','pikuchanneru','pikuchanneru'),
(28,'Shadowmime#4734','shadowmime','NULL','Dylan Mak','Shadowmime','AU','pikuchanneru','pikuchanneru'),
(39,'在水之番#9726','465943395','NULL','NULL','在水之番','CN','pikuchanneru','pikuchanneru'),
(40,'小羚羊#0314','happy-lv','NULL','Hanbin Lv','吕','CN','pikuchanneru','pikuchanneru'),
(41,'洛觞#1925','2517534808','NULL','Lou Shang','洛觞','CN','pikuchanneru','pikuchanneru'),
(46,'kakubi#1166','bi69forgame','NULL','Quang Ong','Bi','VN','pikuchanneru','pikuchanneru'),
(50,'Enje#0505','enjevgc','EnjeVGC','Nicholas Johnson','Enje - Nicholas','ID','pikuchanneru','pikuchanneru'),
(55,'IBOIII#1111','dalisebastian06','notIBOIII','Dali S. P. Noviyanto','IBOIII','ID','pikuchanneru','pikuchanneru'),
(65,'Patrick#4842','patrick123123123','Patrick_VGC','Patrick Cheng','Patricia','HK','pikuchanneru','pikuchanneru'),
(68,'pocoyo#3835','76pocoyo','76pocoyo','Kenny Ongkojoyo','pocoyo','ID','pikuchanneru','pikuchanneru'),
(81,'ぽんぽんた#2372','ぽんぽんた','ponponta1019','NULL','ぽんぽんた','JP','pikuchanneru','pikuchanneru'),
(83,'TheCui819#3978','thecui','NULL','Yiwen Bao','若白不是攻','CN','pikuchanneru','pikuchanneru'),
(86,'まさ#2624','masatama83','masa83_poke','Masahide Tamaki','masa','JP','pikuchanneru','pikuchanneru'),
(90,'Benthejamin56#5766','benthejamin56','benthejamin56','NULL','BTJ56','GB','pikuchanneru','pikuchanneru'),
(109,'PADO#9076','pado93','PadoVGC','Flavio Del Pidio','Pado','IT','pikuchanneru','pikuchanneru'),
(112,'darkmaster491#3629','darkmaster491','darkmaster491','Ricardo Guerra','Rick','US','pikuchanneru','pikuchanneru'),
(120,'Zardichar#0588','zardichar','zardicharvgc','Tyler Alexander','ZardiChar','XX','pikuchanneru','pikuchanneru')
    
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