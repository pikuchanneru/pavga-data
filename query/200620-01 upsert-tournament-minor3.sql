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
        'ASIA STAR TOURNAMENT MINOR 3',
        48,
        '2021-06-19',
        '2021-06-20',
        'https://battlefy.com/pokemon-asia-vg-association/ast-minor-3/60c6131d130e4a469728a11f/',
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