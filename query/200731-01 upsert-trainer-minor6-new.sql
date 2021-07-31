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
('Space*Jordan#1537','jordanvgc','SPACE_JORDANVGC','Jordan Flores','SPACE★JORDAN','MX','pikuchanneru','pikuchanneru'),
('ogjavierrr#4927','javiersince2001','jvviersvndovvl','Javier Nain Sandoval','jvvier','CL','pikuchanneru','pikuchanneru'),
('Peakingsumo#1739','peakingsumo','PeakingsumoVGC','Anthony Scibilia','PeakingSumo','AU','pikuchanneru','pikuchanneru')
    
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