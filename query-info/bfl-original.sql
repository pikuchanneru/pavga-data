with bfl as (
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
)
select
    bfl.trainer_id,
    tt.discord,
    sum(bfl.point_award) as pt
from
    bfl
    left join trainer tt on bfl.trainer_id = tt.id
where
    bfl_rank < 7
group by
    bfl.trainer_id,
    tt.discord
order by
    bfl.trainer_id