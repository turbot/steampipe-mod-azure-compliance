with all_api_app as (
  select
    id
  from
    azure_app_service_web_app
  where
    exists (
      select
      from
        unnest(regexp_split_to_array(kind, ',')) elem
      where
        elem like '%api'
  )
)
select
  -- Required Columns
  a.id as resource,
  case
    when b.id is null then 'skip'
    when configuration -> 'properties' -> 'cors' -> 'allowedOrigins' @> '["*"]' then 'alarm'
    else 'ok'
  end as status,
  case
    when b.id is null then a.title || ' is ' || a.kind || ' kind.'
    when  configuration -> 'properties' -> 'cors' -> 'allowedOrigins' @> '["*"]' then a.name || ' CORS allow all domains to access the application.'
    else a.name || ' CORS does not all domains to access the application.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_app_service_web_app a
  left join all_api_app as b on a.id = b.id,
  azure_subscription sub
where
  sub.subscription_id = a.subscription_id;