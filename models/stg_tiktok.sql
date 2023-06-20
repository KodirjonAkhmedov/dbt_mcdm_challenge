with tiktok as (

select
  campaign_id as campaign_id,
  date as create_date,
  __insert_date as date_birth,
  channel as channel,
  clicks as clicks,
  impressions as impressions,
  spend as spend,
  purchase + add_to_cart + registrations + rt_installs as overall_conversions

  from {{ ref('src_ads_tiktok_ads_all_data') }}
)

select * from tiktok