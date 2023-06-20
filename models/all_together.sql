{{ config (
    materialized="table"
)}}

with facebook as (

    select * from {{ ref('stg_facebook') }}

),

twitter as (

    select * from {{ ref('stg_twitter') }}

),

tiktok as (

    select * from {{ ref('stg_tiktok') }}
),

bing as (
    select * from {{ ref('stg_bing') }}
),

unify_all_ads as (

   (
    select * from facebook 
    union all
    select * from twitter
    union all
    select * from tiktok
    union all
    select * from bing
    )

)


select *,
    --cost_per_engage
    case when overall_conversions != 0 then spend / overall_conversions
    else null
    end as  cost_per_engage,
   --Conversion cost
    case when overall_conversions != 0 then spend / overall_conversions
    ELSE null
    end as conversion_cost,
    /*
    --Impressions by channel
    --twitter
    case when channel = 'Twitter' then impressions
    else null
    end as Twitter_Impressions,
    --facebook
    case when channel = 'Facebook' then impressions
    else null
    end as Facebook_Impressions,
    --tiktok
    case when channel = 'TikTok Ads' then impressions
    else null
    end as Tiktok_Impressions,
    --bing
    case when channel = 'Bing' then impressions
    else null
    end as Bing_Impressions,
    */
    --CPC
    case when clicks != 0 then spend / clicks
    else null   
    end as cpc

 from unify_all_ads
