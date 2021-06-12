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
        'ASIA STAR TOURNAMENT MINOR 2',
        66,
        '2021-06-12',
        '2021-06-13',
        'https://battlefy.com/pokemon-asia-vg-association/ast-minor-2/60bcc222f5905527ba764905/',
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