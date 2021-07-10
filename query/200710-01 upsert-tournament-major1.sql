INSERT INTO
    tournament (
        tier,
        title,
        headcount,
        start_date,
        end_date,
        battlefy,
        created_by,
        updated_by
    )
VALUES
    (
        'MAJOR',
        'ASIA STAR TOURNAMENT MAJOR 3',
        31,
        '2021-07-10',
        '2021-07-11',
        'https://battlefy.com/pokemon-asia-vg-association/ast-major-1/60cf24f1d576a82a21189018/',
        'pikuchanneru',
        'pikuchanneru'
    ) ON CONFLICT (id) DO
UPDATE
SET
    tier = EXCLUDED.tier,
    title = EXCLUDED.title,
    headcount = EXCLUDED.headcount,
    start_date = EXCLUDED.start_date,
    end_date = EXCLUDED.end_date,
    battlefy = EXCLUDED.battlefy,
    created_by = EXCLUDED.created_by,
    updated_by = EXCLUDED.updated_by;