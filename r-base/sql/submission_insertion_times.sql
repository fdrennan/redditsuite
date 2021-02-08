create materialized view if not exists public.submission_insertion_times as (
    select time_collected_utc, count(*) as n_observations
    from submissions
    group by time_collected_utc
    order by time_collected_utc desc
);
