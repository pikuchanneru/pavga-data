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
("AussiePhilNguyen#1806","aussiephilnguyen","Aussie_Phil_N",NULL,"Phil Nguyen","AU","pikuchanneru","pikuchanneru")
("Baars#2096","basvdhaarnhoorn","BaarsKaasVGC",NULL,"Priscilla","CX","pikuchanneru","pikuchanneru")
("Bahamuth#6605","danieljonathan97","MDanielJonathan",NULL,"Bahamuth","ID","pikuchanneru","pikuchanneru")
("bankaisr#3986","15bankai1998",NULL,NULL,"Nhiên Hina","VN","pikuchanneru","pikuchanneru")
("blank#1264","giolozanooumwa",NULL,NULL,"Gio (Patrick Santos)","PH","pikuchanneru","pikuchanneru")
("DarkJorch#5424 ","jorgeyayo2004",NULL,NULL,"DarkJorch ","ES","pikuchanneru","pikuchanneru")
("dddDayDaybbb#1662","718534061","DayDay84400880",NULL,"DayDaysfw","CN","pikuchanneru","pikuchanneru")
("Eutectic#4945","eutectic",NULL,NULL,"Zent","ID","pikuchanneru","pikuchanneru")
("fvgb40#3046","fvgb40","fvgb40",NULL,"fvgb40","AU","pikuchanneru","pikuchanneru")
("Gin #7889","ginjr","gipaarrr",NULL,"Gin","ID","pikuchanneru","pikuchanneru")
("Gon#6122","churrerovgc","ElChurrero13",NULL,"Gon","ES","pikuchanneru","pikuchanneru")
("imrobberting#7130","rb1cuartero","imrobberting",NULL,"Rob","PH","pikuchanneru","pikuchanneru")
("Jayden1200#6349","jayden120","jayden120000",NULL,"jayden120","AU","pikuchanneru","pikuchanneru")
("JenZzz#9907","jenssoto","soto_jens",NULL,"Jenzzz","PR","pikuchanneru","pikuchanneru")
("Kaizen#5257","avsyap","KaizenVGC",NULL,"Andrew","PH","pikuchanneru","pikuchanneru")
("kakunaka#9011","shinichi123mm","kakunaka_VGC",NULL,"kakunaka","JP","pikuchanneru","pikuchanneru")
("Magnetman210#3917","adryan-sutantoso-2","MagnetmanVGC",NULL,"Magnetman","ID","pikuchanneru","pikuchanneru")
("Maquia#7386","teamathenawifibattles","heliosofsunvgc",NULL,"Helios","SG","pikuchanneru","pikuchanneru")
("Meta Knight 1320#6620","metaknight1320",NULL,NULL,"Metaknight","CL","pikuchanneru","pikuchanneru")
("Mr.PokÉnjoy#8551","unknown5bc1393935b6fd03bd1d63fb","Mr_PokEnjoy",NULL,"Pokenjoy","JP","pikuchanneru","pikuchanneru")
("nanoooooo#4580","purplemecf",NULL,NULL,"Nanoooooo","ID","pikuchanneru","pikuchanneru")
("Nintendolphin#2016","826672284","Nintendolphins",NULL,"花寄寮VGC/Nintendolphins","CN","pikuchanneru","pikuchanneru")
("pikuchanneru#0277","pikuchanneru","pikuchanneru",NULL,"Piku","ID","pikuchanneru","pikuchanneru")
("Raya Stark#5370","raymond_squared",NULL,NULL,"Raya Stark","ID","pikuchanneru","pikuchanneru")
("Rey J#2898","reynism",NULL,NULL,"reynism","ID","pikuchanneru","pikuchanneru")
("Roversombra#2603","earaaguaron","roversombra",NULL,"Roversombra","ES","pikuchanneru","pikuchanneru")
("scar1et#7427","_scar1et_","scarlet_ik",NULL,"すかーれっと","CN","pikuchanneru","pikuchanneru")
("Shadowmime#4734","shadowmime",NULL,NULL,"Shadowmime","AU","pikuchanneru","pikuchanneru")
("SoulKnight66#1317","zacharychia12","SoulKnight66",NULL,"SoulKnightVGC","SG","pikuchanneru","pikuchanneru")
("Sportaholic#6548","Sportaholic_21","Sportaholic_21",NULL,"Long","VN","pikuchanneru","pikuchanneru")
("TehDrink#2458","tehdrink","tehdrink",NULL,"tehdrink/Kester","SG","pikuchanneru","pikuchanneru")
("Tide(消波塊)#4240","ga0620ry","ga0620ryTW",NULL,"YaYeee","TW","pikuchanneru","pikuchanneru")
("Tomoe#0100","rivenbeatsfiora",NULL,NULL,"Tomoe","PH","pikuchanneru","pikuchanneru")
("updateVGC#0036","updatevgc","updateVGC",NULL,"updatevgc","BD","pikuchanneru","pikuchanneru")
("YuyuVGC#3501","1457201939",NULL,NULL,"YuyuVGC/彧","CN","pikuchanneru","pikuchanneru")
("がはく#2290","pochapencil","gahaku_poke",NULL,"gahaku","JP","pikuchanneru","pikuchanneru")
("ゴートゥ#4685","ゴートゥ","GotoTapuFiniVGC",NULL,"ゴートゥ","JP","pikuchanneru","pikuchanneru")
("ぺい#9801","pokepei17","pokepei17",NULL,"Paypay","JP","pikuchanneru","pikuchanneru")
("在水之番#9726","465943395",NULL,NULL,"在水之番","CN","pikuchanneru","pikuchanneru")
("小羚羊#0314","happy-lv",NULL,NULL,"吕","CN","pikuchanneru","pikuchanneru")
("洛觞#1925","2517534808",NULL,NULL,"洛觞","CN","pikuchanneru","pikuchanneru")
    
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