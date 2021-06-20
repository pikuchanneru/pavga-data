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
(2,'Baars#2096','basvdhaarnhoorn','BaarsKaasVGC','Bas van der Heijden','Priscilla','NL','pikuchanneru','pikuchanneru'),
(3,'Bahamuth#6605','danieljonathan97','MDanielJonathan','Daniel Jonathan','Bahamuth','ID','pikuchanneru','pikuchanneru'),
(10,'Gin#7889','ginjr','gipaarrr','Muhammad Ghivar Arrofi','Gin','ID','pikuchanneru','pikuchanneru'),
(11,'Gon#6122','churrerovgc','ElChurrero13','Gonzalo Martínez','Gon','ES','pikuchanneru','pikuchanneru'),
(12,'imrobberting#7130','rb1cuartero','imrobberting',NULL,'Rob','PH','pikuchanneru','pikuchanneru'),
(17,'Magnetman210#3917','adryan-sutantoso-2','MagnetmanVGC','Adryan Sutantoso','Magnetman','ID','pikuchanneru','pikuchanneru'),
(23,'pikuchanneru#0277','pikuchanneru','pikuchanneru','Taufik Wiradarmo','Piku','ID','pikuchanneru','pikuchanneru'),
(25,'Rey J#2898','reynism',NULL,'Reynaldo Janala','Reynism','ID','pikuchanneru','pikuchanneru'),
(26,'Roversombra#2603','earaaguaron','roversombra',NULL,'Roversombra','ES','pikuchanneru','pikuchanneru'),
(34,'updateVGC#0036','updatevgc','updateVGC','Thanic Samin','Alice','BD','pikuchanneru','pikuchanneru'),
(35,'YuyuVGC#3501','1457201939','Yuyu980901',NULL,'彧','CN','pikuchanneru','pikuchanneru'),
(39,'在水之番#9726','465943395',NULL,NULL,'在水之番','CN','pikuchanneru','pikuchanneru'),
(44,'Mkh#3748','alvinsoyol','AnabelVg','Mak Kwan Ho','AnabelVg','HK','pikuchanneru','pikuchanneru'),
(50,'Enje#0505','enjevgc','EnjeVGC','Nicholas Johnson','Enje','ID','pikuchanneru','pikuchanneru'),
(51,'funyy253#1142','phantruongthinh2013','TrngThnhPhan1','Thinh Phan','funyy253','VN','pikuchanneru','pikuchanneru'),
(55,'IBOIII#1111','dalisebastian06','notIBOIII','Dali S. P. Noviyanto','IBOIII','ID','pikuchanneru','pikuchanneru'),
(59,'CardCaptorSakuraDragona#1710','lemepa11','Lemepa11','Leslie Mendoza','Leslie Mendoza','PR','pikuchanneru','pikuchanneru'),
(61,'Mayburn#5936','josua111','josbunn','Josua S. Marbun','Mayburn','ID','pikuchanneru','pikuchanneru'),
(65,'Patrick#4842','patrick123123123','Patrick_VGC','Patrick Cheng','Patricia','HK','pikuchanneru','pikuchanneru'),
(68,'pocoyo#3835','76pocoyo','76pocoyo','Kenny Ongkojoyo','pocoyo','ID','pikuchanneru','pikuchanneru'),
(69,'PokeSol#6969','pokesolft','PokeSoll','Hugo Gómez','PokeSol','ES','pikuchanneru','pikuchanneru'),
(73,'Waffles#9909','wafflestheasianyenbear','TheAsianYenbear','Alex Usami','Waffles','JP','pikuchanneru','pikuchanneru'),
(83,'TheCui819#3978','thecui',NULL,'Yiwen Bao','若白不是攻','CN','pikuchanneru','pikuchanneru'),
(84,'葱烧板栗#4499','葱烧板栗',NULL,'Zheyu Lin','葱烧板栗','CN','pikuchanneru','pikuchanneru'),
(85,'Jingshu LiVGC#2033','603770997',NULL,'Jingshu Li','鲁路修四海','CN','pikuchanneru','pikuchanneru')
    
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