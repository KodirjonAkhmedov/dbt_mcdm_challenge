with facebook as (

    
select
  campaign_id as campaign_id,
  date as create_date, 
  __insert_date as date_birth,
  channel as channel,
  clicks as clicks,
  impressions as impressions,
  spend as spend,
  purchase + add_to_cart + complete_registration as overall_conversions 
  
from {{ ref('src_ads_creative_facebook_all_data') }}

)

select * from facebook

