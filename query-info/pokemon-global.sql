WITH teams AS (
    SELECT
        tournament_id,
        team,
        two_nil + two_one AS win,
        nil_two + one_two AS loss,
        draw,
        point_award
    FROM
        standing
),
roster AS (
    SELECT
        unnest(team) AS pokemon,
        tournament_id,
        win,
        loss,
        draw,
        point_award
    FROM
        teams
),
headcount AS (
    SELECT
        tournament_id,
        COUNT(*) AS count
    FROM
        standing
    GROUP BY
        tournament_id
),
ptsum AS (
    SELECT
        tournament_id,
        SUM(point_award) as sum
    FROM
        standing
    GROUP BY
        tournament_id
),
usage AS (
    SELECT
        tournament_id,
        pokemon,
        count(pokemon) AS count
    FROM
        roster
    GROUP BY
        tournament_id,
        pokemon
),
result AS (
    SELECT
        tournament_id,
        pokemon,
        sum(win) AS win,
        sum(loss) AS loss,
        sum(draw) AS draw,
        sum(win) + sum(loss) + sum(draw) as match_played
    FROM
        roster
    GROUP BY
        tournament_id,
        pokemon
),
reward AS (
    SELECT
        tournament_id,
        pokemon,
        sum(point_award) AS pt
    FROM
        roster
    GROUP BY
        tournament_id,
        pokemon
),
entire as (
    SELECT
        uu.tournament_id,
        uu.pokemon,
        uu.count,
        round(uu.count / hc.count :: DECIMAL, 4) AS "usage_share",
        rr.win,
        rr.draw,
        rr.loss,
        CASE
            rr.match_played
            WHEN 0 THEN 0
            ELSE round(
                rr.win / rr.match_played :: DECIMAL,
                4
            )
        END AS winrate,
        rw.pt,
        round(rw.pt / ps.sum :: DECIMAL, 4) AS "pt_share",
        hc.count as "helper_count",
        rr.match_played as "helper_matchcount",
        ps.sum as "helper_pt"
    FROM
        usage uu
        LEFT JOIN result rr ON uu.tournament_id = rr.tournament_id
        AND uu.pokemon = rr.pokemon
        LEFT JOIN headcount hc ON uu.tournament_id = hc.tournament_id
        LEFT JOIN reward rw ON uu.tournament_id = rw.tournament_id
        AND uu.pokemon = rw.pokemon
        LEFT JOIN ptsum ps ON uu.tournament_id = ps.tournament_id
    ORDER BY
        usage_share DESC,
        winrate DESC,
        pt_share DESC
)
SELECT
    pokemon,
    sum(count) as "count",
    round(sum(count) / sum(helper_count) :: DECIMAL, 4) AS "usage_share",
    sum(win) as "win",
    sum(draw) as "draw",
    sum(loss) as "loss",
    CASE
        sum(helper_matchcount)
        WHEN 0 THEN 0
        ELSE round(
            sum(win) / sum(helper_matchcount) :: DECIMAL,
            4
        )
    END AS winrate,
    sum(pt) as "pt",
    round(sum(pt) / sum(helper_pt) :: DECIMAL, 4) AS "pt_share"
FROM
    entire
GROUP BY
    pokemon
ORDER BY
    usage_share DESC,
    winrate DESC,
    pt_share DESC