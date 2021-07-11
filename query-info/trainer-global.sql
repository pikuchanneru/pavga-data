WITH trainerstanding AS (
    SELECT
        trainer_id,
        tournament_id,
        two_nil + two_one + bye AS win,
        nil_two + one_two + double_loss AS loss,
        draw,
        point_award
    FROM
        standing
    ORDER BY
        trainer_id,
        tournament_id
),
summary as (
    SELECT
        trainer_id,
        count(tournament_id) as participation,
        sum(win) as win,
        sum(loss) as loss,
        sum(draw) as draw,
        round(
            sum(win) / (sum(win) + sum(loss) + sum(draw)) :: DECIMAL,
            4
        ) AS "winrate"
    FROM
        trainerstanding ts
    GROUP BY
        trainer_id
    ORDER BY
        win,
        loss,
        draw
),
bfl_mi as (
    select
        ss.tournament_id,
        tt.tier,
        ss.trainer_id,
        ss.point_award,
        RANK () OVER (
            PARTITION BY ss.trainer_id
            ORDER BY
                ss.point_award DESC
        ) bfl_rank
    from
        standing ss
        left join tournament tt on ss.tournament_id = tt.id
    where
        tier = 'MINOR'
    order by
        ss.trainer_id
),
bfl_minor as (
    select
        bfl.trainer_id,
        sum(bfl.point_award) as pt
    from
        bfl_mi bfl
        left join trainer tt on bfl.trainer_id = tt.id
    where
        bfl_rank < 7
    group by
        bfl.trainer_id
    order by
        bfl.trainer_id
),
bfl_ma as (
    select
        ss.tournament_id,
        tt.tier,
        ss.trainer_id,
        ss.point_award,
        RANK () OVER (
            PARTITION BY ss.trainer_id
            ORDER BY
                ss.point_award DESC
        ) bfl_rank
    from
        standing ss
        left join tournament tt on ss.tournament_id = tt.id
    where
        tier = 'MAJOR'
    order by
        ss.trainer_id
),
bfl_major as (
    select
        bfl.trainer_id,
        sum(bfl.point_award) as pt
    from
        bfl_ma bfl
        left join trainer tt on bfl.trainer_id = tt.id
    where
        bfl_rank < 3
    group by
        bfl.trainer_id
    order by
        bfl.trainer_id
)
SELECT
    coalesce(tt.discord, ''),
    coalesce(tt.battlefy, ''),
    coalesce(tt.twitter, ''),
    coalesce(tt.realname, ''),
    coalesce(tt.country, ''),
    ss.participation,
    ss.win,
    ss.loss,
    ss.draw,
    ss.winrate,
    coalesce(bi.pt,0) as minor_pt,
    coalesce(ba.pt,0) as major_pt,
    coalesce(bi.pt,0) + coalesce(ba.pt,0) as total_pt
from
    trainer tt
    LEFT JOIN summary ss ON ss.trainer_id = tt.id
    LEFT JOIN bfl_minor bi ON bi.trainer_id = tt.id
    LEFT JOIN bfl_major ba ON ba.trainer_id = tt.id
ORDER BY
    total_pt DESC,
    major_pt DESC,
    minor_pt DESC,
    ss.winrate DESC,
    ss.win DESC,
    ss.loss ASC,
    ss.participation DESC,
    tt.discord ASC