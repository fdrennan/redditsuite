create materialized view if not exists public.submission_meta as (
    select subreddit,
           count(*) as n_observations,
           min(time_collected_utc) as observation_first,
           max(time_collected_utc) as observation_last
    from submissions
    group by subreddit
    order by n_observations desc
);
