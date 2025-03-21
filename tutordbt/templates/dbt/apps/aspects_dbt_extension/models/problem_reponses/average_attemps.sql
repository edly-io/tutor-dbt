select
    problem_id, AVG(attempts) as average_attempts
from
    (
        select
            problem_id,
            max(attempts) as attempts
        from
            {{ ref('int_problem_results') }}
        group by
            actor_id,
            problem_id
    )
group by problem_id
