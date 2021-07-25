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
(6,65,'{Venusaur,Torkoal,Porygon2,Landorus-Therian,Regieleki,Urshifu-SS}',NULL,3,3,0,1,0,0,0,4,FALSE,1,16,NULL,NULL,'pikuchanneru','pikuchanneru'),
(6,20,'{Uxie,Heatran,Landorus-Therian,Tapu Fini,Regieleki,Glastrier}',NULL,0,5,1,1,0,0,0,2,FALSE,2,11,NULL,NULL,'pikuchanneru','pikuchanneru'),
(6,68,'{Regieleki,Urshifu-RS,Togekiss,Rillaboom,Heatran,Mamoswine}',NULL,2,3,0,1,0,0,0,1,FALSE,3,8,NULL,NULL,'pikuchanneru','pikuchanneru'),
(6,112,'{Urshifu-RS,Coalossal,Rillaboom,Incineroar,Togekiss,Dragapult}',NULL,0,4,0,2,0,0,0,3,FALSE,4,8,NULL,NULL,'pikuchanneru','pikuchanneru'),
(6,86,'{Thundurus,Landorus-Therian,Urshifu-SS,Jynx,Incineroar,Glastrier}',NULL,1,2,0,2,0,0,0,5,FALSE,5,6,NULL,NULL,'pikuchanneru','pikuchanneru'),
(6,26,'{Porygon2,Marowak-Alola,Amoonguss,Blastoise,Celesteela,Landorus-Therian}',NULL,1,2,1,1,0,0,0,6,FALSE,6,6,NULL,NULL,'pikuchanneru','pikuchanneru'),
(6,102,'{Torkoal,Venusaur,Indeedee-F,Hatterene,Urshifu-SS,Tauros}',NULL,0,3,0,2,0,0,0,7,FALSE,7,6,NULL,NULL,'pikuchanneru','pikuchanneru'),
(6,83,'{Metagross,Spectrier,Grimmsnarl,Tapu Fini,Landorus-Therian,Rotom-Heat}',NULL,2,1,0,2,0,0,0,8,FALSE,8,6,NULL,NULL,'pikuchanneru','pikuchanneru'),
(6,28,'{Mimikyu,Tapu Fini,Rillaboom,Stakataka,Venusaur,Torkoal}',NULL,1,1,1,1,0,1,0,9,FALSE,9,4,NULL,NULL,'pikuchanneru','pikuchanneru'),
(6,60,'{Braviary,Krookodile,Volcarona,Regirock,Dusclops,Jolteon}',NULL,2,0,1,2,0,0,0,10,FALSE,10,4,NULL,NULL,'pikuchanneru','pikuchanneru'),
(6,126,'{Indeedee-F,Regieleki,Moltres-Galar,Blastoise,Landorus-Therian,Incineroar}',NULL,1,1,3,0,0,0,0,11,FALSE,11,4,NULL,NULL,'pikuchanneru','pikuchanneru'),
(6,3,'{Metagross,Rotom-Heat,Grimmsnarl,Rillaboom,Tapu Fini,Landorus-Therian}',NULL,1,1,1,2,0,0,0,12,FALSE,12,4,NULL,NULL,'pikuchanneru','pikuchanneru'),
(6,127,'{Landorus-Therian,Heatran,Cresselia,Zapdos,Tapu Fini,Urshifu-SS}',NULL,1,1,3,0,0,0,0,13,FALSE,13,4,NULL,NULL,'pikuchanneru','pikuchanneru'),
(6,120,'{Coalossal,Dragapult,Rillaboom,Urshifu-RS,Togekiss,Incineroar}',NULL,1,1,1,2,0,0,0,14,FALSE,14,4,NULL,NULL,'pikuchanneru','pikuchanneru'),
(6,40,'{Cinderace,Whimsicott,Regieleki,Urshifu-SS,Mamoswine,Glastrier}',NULL,2,0,0,3,0,0,0,15,FALSE,15,4,NULL,NULL,'pikuchanneru','pikuchanneru'),
(6,39,'{Incineroar,Exeggutor-Alola,Stakataka,Glastrier,Indeedee-F,Cresselia}',NULL,2,0,2,1,0,0,0,16,FALSE,16,4,NULL,NULL,'pikuchanneru','pikuchanneru'),
(6,128,'{Tornadus,Urshifu-SS,Rillaboom,Tapu Fini,Cinderace,Metagross}',NULL,0,0,1,3,0,1,0,17,FALSE,17,2,NULL,NULL,'pikuchanneru','pikuchanneru'),
(6,9,'{Armaldo,Pelipper,Incineroar,Copperajah,Appletun,Raichu}',NULL,0,0,2,2,0,1,0,18,FALSE,18,2,NULL,NULL,'pikuchanneru','pikuchanneru'),
(6,4,'{Entei,Moltres-Galar,Grimmsnarl,Metagross,Rotom-Wash,Porygon2}',NULL,0,1,3,0,0,0,0,19,TRUE,19,0,NULL,NULL,'pikuchanneru','pikuchanneru'),
(6,21,'{Tapu Lele,Whimsicott,Metagross,Umbreon,Entei,Rotom-Wash}',NULL,0,0,0,1,0,0,0,20,TRUE,20,0,NULL,NULL,'pikuchanneru','pikuchanneru')
    
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