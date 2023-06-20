with twitter as (

    select
    campaign_id as campaign_id,
    date as create_date, 
    __insert_date as date_birth,
    channel as channel,
    clicks as clicks,
    impressions as impressions,
    spend as spend,
    engagements as overall_conversions
    from {{ ref('src_promoted_tweets_twitter_all_data')}}
)


select * from  twitter
