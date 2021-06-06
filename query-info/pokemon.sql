WITH teams AS (
    SELECT
        team,
        two_nil + two_one AS win,
        nil_two + one_two + double_loss AS loss,
        draw,
        point_award
    FROM
        standing
),
roster AS (
    SELECT
        unnest(team) AS pokemon,
        win,
        loss,
        draw,
        point_award
    FROM
        teams
),
usage AS (
    SELECT
        pokemon,
        count(pokemon) AS count,
        round(count(pokemon) / 41 :: DECIMAL, 4) AS "share"
    FROM
        roster
    GROUP BY
        pokemon
),
winrate AS (
    SELECT
        pokemon,
        sum(win) AS win,
        sum(loss) AS loss,
        sum(draw) AS draw,
        round(
            sum(win) /(sum(win) + sum(loss) + sum(draw)) :: DECIMAL,
            4
        ) AS winrate
    FROM
        roster
    GROUP BY
        pokemon
),
ppt AS (
    SELECT
        tournament_id,
        SUM(point_award)
    FROM
        standing
    GROUP BY
        tournament_id
),
ptrate AS (
    SELECT
        pokemon,
        sum(point_award) AS pt
    FROM
        roster
    GROUP BY
        pokemon
)
SELECT
    uu.pokemon,
    uu.count,
    uu.share,
    ww.win,
    ww.loss,
    ww.draw,
    ww.winrate
FROM
    usage uu
    LEFT JOIN winrate ww ON ww.pokemon = uu.pokemon
ORDER BY
    uu.count DESC,
    ww.winrate DESC,
    ww.win DESC,
    ww.loss ASC