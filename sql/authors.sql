create materialized view if not exists public.authors as (
    select author,
           subreddit,
           count(*) as n_observations,
           min(time_collected_utc) as observation_first,
           max(time_collected_utc) as observation_last
    from submissions
    group by author, subreddit
    order by author, subreddit desc
);
