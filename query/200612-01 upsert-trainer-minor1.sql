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
(1,'AussiePhilNguyen#1806','aussiephilnguyen','Aussie_Phil_N','Phil Nguyen','Phil Nguyen','AU','pikuchanneru','pikuchanneru'),
(2,'Baars#2096','basvdhaarnhoorn','BaarsKaasVGC','Bas van der Heijden','Baars','NL','pikuchanneru','pikuchanneru'),
(3,'Bahamuth#6605','danieljonathan97','MDanielJonathan','Daniel Jonathan','Bahamuth','ID','pikuchanneru','pikuchanneru'),
(4,'bankaisr#3986','15bankai1998',NULL,'Hunh Dong Minh','Bankaisr','VN','pikuchanneru','pikuchanneru'),
(5,'blank#1264','giolozanooumwa',NULL,NULL,'Gio (Patrick Santos)','PH','pikuchanneru','pikuchanneru'),
(6,'DarkJorch#5424','jorgeyayo2004',NULL,NULL,'DarkJorch','ES','pikuchanneru','pikuchanneru'),
(7,'dddDayDaybbb#1662','718534061','DayDay84400880','Haotian Xiao','DayDaysfw','CN','pikuchanneru','pikuchanneru'),
(8,'Eutectic#4945','eutectic',NULL,'Mochamad Firmansyah','Zent','ID','pikuchanneru','pikuchanneru'),
(9,'fvgb40#3046','fvgb40','fvgb40',NULL,'fvgb40','AU','pikuchanneru','pikuchanneru'),
(10,'Gin #7889','ginjr','gipaarrr',NULL,'Gin','ID','pikuchanneru','pikuchanneru'),
(11,'Gon#6122','churrerovgc','ElChurrero13','Gonzalo Martínez','Gon','ES','pikuchanneru','pikuchanneru'),
(12,'imrobberting#7130','rb1cuartero','imrobberting',NULL,'Rob','PH','pikuchanneru','pikuchanneru'),
(13,'Jayden1200#6349','jaydencasserly','jayden120000','Jayden Casserly','Jayden1200','AU','pikuchanneru','pikuchanneru'),
(14,'JenZzz#9907','jenssoto','soto_jens',NULL,'Jenzzz','PR','pikuchanneru','pikuchanneru'),
(15,'Kaizen#5257','avsyap','KaizenVGC',NULL,'Andrew','PH','pikuchanneru','pikuchanneru'),
(16,'kakunaka#9011','shinichi123mm','kakunaka_VGC','Shinichi Matsuda','kakunaka','JP','pikuchanneru','pikuchanneru'),
(17,'Magnetman210#3917','adryan-sutantoso-2','MagnetmanVGC','Adryan Sutantoso','Magnetman','ID','pikuchanneru','pikuchanneru'),
(18,'Maquia#7386','teamathenawifibattles','heliosofsunvgc',NULL,'Helios','SG','pikuchanneru','pikuchanneru'),
(19,'Meta Knight 1320#6620','metaknight1320',NULL,NULL,'Metaknight','CL','pikuchanneru','pikuchanneru'),
(20,'Mr.PokÉnjoy#8551','unknown5bc1393935b6fd03bd1d63fb','Mr_PokEnjoy','Luka Del Medico','Pokenjoy','IT','pikuchanneru','pikuchanneru'),
(21,'nanoooooo#4580','purplemecf',NULL,'Andy Willyanto Lim','Nanoooooo','ID','pikuchanneru','pikuchanneru'),
(22,'Nintendolphin#2016','826672284','Nintendolphins',NULL,'花寄寮VGC/Nintendolphins','CN','pikuchanneru','pikuchanneru'),
(23,'pikuchanneru#0277','pikuchanneru','pikuchanneru','Taufik Wiradarmo','Piku','ID','pikuchanneru','pikuchanneru'),
(24,'Raya Stark#5370','raymond_squared',NULL,'Raymond Boles','Raya Stark','ID','pikuchanneru','pikuchanneru'),
(25,'Rey J#2898','reynism',NULL,'Reynaldo Janala','reynism','ID','pikuchanneru','pikuchanneru'),
(26,'Roversombra#2603','earaaguaron','roversombra',NULL,'Roversombra','ES','pikuchanneru','pikuchanneru'),
(27,'scar1et#7427','_scar1et_','scarlet_ik',NULL,'すかーれっと','CN','pikuchanneru','pikuchanneru'),
(28,'Shadowmime#4734','shadowmime',NULL,NULL,'Shadowmime','AU','pikuchanneru','pikuchanneru'),
(29,'SoulKnight66#1317','zacharychia12','SoulKnight66',NULL,'SoulKnightVGC','SG','pikuchanneru','pikuchanneru'),
(30,'Sportaholic#6548','Sportaholic_21','Sportaholic_21','Phuc Long Nguyen','Long','VN','pikuchanneru','pikuchanneru'),
(31,'TehDrink#2458','tehdrink','tehdrink','Kester Teh','Kesty','SG','pikuchanneru','pikuchanneru'),
(32,'Tide(消波塊)#4240','ga0620ry','ga0620ryTW','Yayi Jhou','YaYeee','TW','pikuchanneru','pikuchanneru'),
(33,'Tomoe#0100','rivenbeatsfiora',NULL,NULL,'Tomoe','PH','pikuchanneru','pikuchanneru'),
(34,'updateVGC#0036','updatevgc','updateVGC','Thanic Samin','updatevgc','BD','pikuchanneru','pikuchanneru'),
(35,'YuyuVGC#3501','1457201939',NULL,NULL,'YuyuVGC/彧','CN','pikuchanneru','pikuchanneru'),
(36,'がはく#2290','pochapencil','gahaku_poke',NULL,'gahaku','JP','pikuchanneru','pikuchanneru'),
(37,'ゴートゥ#4685','ゴートゥ','GotoTapuFiniVGC',NULL,'ゴートゥ','JP','pikuchanneru','pikuchanneru'),
(38,'ぺい#9801','pokepei17','pokepei17',NULL,'Paypay','JP','pikuchanneru','pikuchanneru'),
(39,'在水之番#9726','465943395',NULL,NULL,'在水之番','CN','pikuchanneru','pikuchanneru'),
(40,'小羚羊#0314','happy-lv',NULL,NULL,'吕','CN','pikuchanneru','pikuchanneru'),
(41,'洛觞#1925','2517534808',NULL,NULL,'洛觞','CN','pikuchanneru','pikuchanneru')
    
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