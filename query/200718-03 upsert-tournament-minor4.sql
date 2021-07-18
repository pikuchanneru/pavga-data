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
        'ASIA STAR TOURNAMENT MINOR 4',
        27,
        '2021-07-17',
        '2021-07-18',
        'https://battlefy.com/pokemon-asia-vg-association/ast-minor-4/60eb558fd2dcfb4ae51dc75f/',
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