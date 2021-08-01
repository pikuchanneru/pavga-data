INSERT INTO
    standing (
        tournament_id
    ,trainer_id
    ,team
    ,team_super
    ,two_one
    ,two_nil
    ,one_two
    ,nil_two
    ,double_loss
    ,bye
    ,draw
    ,swiss
    ,dnf
    ,finish
    ,point_award
    ,prize_award
    ,prize_currency
    ,created_by
    ,updated_by
    )
VALUES
(7,4,'{Entei,Moltres-Galar,Grimmsnarl,Metagross,Rotom-Wash,Porygon2}',NULL,2,4,0,0,0,1,0,1,FALSE,1,15,NULL,NULL,'pikuchanneru','pikuchanneru'),
(7,83,'{Mimikyu,Stakataka,Amoonguss,Torkoal,Venusaur,Rotom-Wash}',NULL,3,1,1,1,0,1,0,3,FALSE,2,10,NULL,NULL,'pikuchanneru','pikuchanneru'),
(7,20,'{Armaldo,Pelipper,Raichu,Appletun,Incineroar,Copperajah}',NULL,3,0,2,0,0,1,0,2,FALSE,3,7,NULL,NULL,'pikuchanneru','pikuchanneru'),
(7,102,'{Coalossal,Urshifu-RS,Togekiss,Incineroar,Dragapult,Rillaboom}',NULL,1,3,0,2,0,0,0,4,FALSE,4,7,NULL,NULL,'pikuchanneru','pikuchanneru'),
(7,112,'{Metagross,Spectrier,Grimmsnarl,Tapu Fini,Landorus-Therian,Rotom-Heat}',NULL,2,1,1,1,0,0,0,5,FALSE,5,5,NULL,NULL,'pikuchanneru','pikuchanneru'),
(7,60,'{Dragapult,Clefairy,Celesteela,Raichu,Landorus-Therian,Rotom-Wash}',NULL,1,0,1,1,0,1,0,6,FALSE,6,5,NULL,NULL,'pikuchanneru','pikuchanneru'),
(7,120,'{Torkoal,Venusaur,Indeedee-F,Dusclops,Regirock,Rotom-Wash}',NULL,0,2,2,0,0,0,0,7,FALSE,7,5,NULL,NULL,'pikuchanneru','pikuchanneru'),
(7,28,'{Regice,Runerigus,Togekiss,Garchomp,Heatran,Pheromosa}',NULL,0,2,1,1,0,0,0,8,FALSE,8,5,NULL,NULL,'pikuchanneru','pikuchanneru'),
(7,9,'{Urshifu-RS,Coalossal,Rillaboom,Incineroar,Togekiss,Dragapult}',NULL,0,1,1,1,0,1,0,9,FALSE,9,3,NULL,NULL,'pikuchanneru','pikuchanneru'),
(7,129,'{Incineroar,Exeggutor-Alola,Scizor,Glastrier,Indeedee-F,Cresselia}',NULL,0,2,1,1,0,0,0,10,FALSE,10,3,NULL,NULL,'pikuchanneru','pikuchanneru'),
(7,127,'{Coalossal,Dragapult,Togekiss,Incineroar,Rillaboom,Urshifu-RS}',NULL,0,0,0,3,0,1,0,11,FALSE,11,3,NULL,NULL,'pikuchanneru','pikuchanneru'),
(7,39,'{Grimmsnarl,Entei,Moltres-Galar,Metagross,Runerigus,Tapu Fini}',NULL,1,0,1,2,0,0,0,12,FALSE,12,3,NULL,NULL,'pikuchanneru','pikuchanneru'),
(7,130,'{Landorus-Therian,Heatran,Cresselia,Zapdos,Tapu Fini,Urshifu-SS}',NULL,1,0,2,0,0,0,0,13,TRUE,13,0,NULL,NULL,'pikuchanneru','pikuchanneru'),
(7,40,'{Moltres-Galar,Landorus-Therian,Regieleki,Grimmsnarl,Spectrier,Registeel}',NULL,0,0,0,2,0,0,0,14,TRUE,14,0,NULL,NULL,'pikuchanneru','pikuchanneru'),
(7,131,'{Kommo-o,Rillaboom,Blastoise,Thundurus,Landorus-Therian,Metagross}',NULL,0,0,1,1,0,0,0,15,TRUE,15,0,NULL,NULL,'pikuchanneru','pikuchanneru')
    
    ON CONFLICT (id) DO
UPDATE
SET
    tournament_id = EXCLUDED.tournament_id
    ,trainer_id = EXCLUDED.trainer_id
    ,team = EXCLUDED.team
    ,team_super = EXCLUDED.team_super
    ,two_one = EXCLUDED.two_one
    ,two_nil = EXCLUDED.two_nil
    ,one_two = EXCLUDED.one_two
    ,nil_two = EXCLUDED.nil_two
    ,double_loss = EXCLUDED.double_loss
    ,bye = EXCLUDED.bye
    ,draw = EXCLUDED.draw
    ,swiss = EXCLUDED.swiss
    ,dnf = EXCLUDED.dnf
    ,finish = EXCLUDED.finish
    ,point_award = EXCLUDED.point_award
    ,prize_award = EXCLUDED.prize_award
    ,prize_currency = EXCLUDED.prize_currency
    ,created_by = EXCLUDED.created_by,
    updated_by = EXCLUDED.updated_by;