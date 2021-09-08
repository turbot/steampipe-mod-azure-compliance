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
    when client_cert_enabled then 'ok'
    else 'alarm'
  end as status,
  case
    when b.id is null then a.title || ' is ' || a.kind || ' kind.'
    when client_cert_enabled then a.name || ' client certificate enabled.'
    else a.name || ' client certificate disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_app_service_web_app as a
  left join all_api_app as b on a.id = b.id,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;