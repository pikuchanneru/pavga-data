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
        'MINOR',
        'ASIA STAR TOURNAMENT MINOR 1',
        41,
        '2021-06-05',
        '2021-06-06',
        'https://battlefy.com/pokemon-asia-vg-association/ast-minor-1/60b1fc7bea06cc1153e5d59f/',
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