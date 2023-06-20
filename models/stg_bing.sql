with bing as (

select
  campaign_id as campaign_id,
  date as create_date,
  __insert_date as date_birth,
  channel as channel,
  clicks as clicks,
  imps as impressions,
  spend as spend,
  conv as overall_conversions
FROM {{ ref('src_ads_bing_all_data') }}

)


select * from bing