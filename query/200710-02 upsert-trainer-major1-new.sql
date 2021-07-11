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
('Spray&Pray#3869','spraypray',NULL,NULL,'ハキ','JP','pikuchanneru','pikuchanneru'),
('PADO#9076','pado93','PadoVGC','Flavio Del Pidio','Pado','IT','pikuchanneru','pikuchanneru'),
('クロノ#4574','kurono_p','kurono_p',NULL,'クロノ','JP','pikuchanneru','pikuchanneru'),
('darkmaster491#3629','darkmaster491','darkmaster491','Ricardo Guerra','Rick','US','pikuchanneru','pikuchanneru'),
('Mogar (They/Them)#8803','malcolmmackellar','MogarChu','Malcolm Mackellar','Mogar','AU','pikuchanneru','pikuchanneru'),
('Torviv#1321','torviv','TorvivVGC','Víctor','Torviv','ES','pikuchanneru','pikuchanneru'),
('RillaMood#2609','mentonaga','JustinMenton','Justin Menton','JuZZiMeNt0','AU','pikuchanneru','pikuchanneru'),
('ChloePrice311#1372','chloeprice311',NULL,'Chloe Price','chloe','CN','pikuchanneru','pikuchanneru'),
('Inge_#3538','ingevgc',NULL,'David Israel Soto','IngeVGC','MX','pikuchanneru','pikuchanneru'),
('Pokesun1#6509','pokesun1','Pokesun1v','Sali Resuli','Alessandra','IT','pikuchanneru','pikuchanneru'),
('cobalte#5766','cobalte',NULL,'Emma','BigWheelVGC','AU','pikuchanneru','pikuchanneru'),
('Zardichar#0588','zardichar','zardicharvgc','Tyler Alexander','ZardiChar','XX','pikuchanneru','pikuchanneru')
    
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