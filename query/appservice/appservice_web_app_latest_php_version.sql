with all_web_app as (
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
        elem like 'app%'
    )
    and
    exists (
      select
      from
        unnest(regexp_split_to_array(kind, ',')) elem
      where
        elem = 'linux'
    )
)
select
  -- Required Columns
  a.id as resource,
  case
    when b.id is null then 'skip'
    when configuration -> 'properties' ->> 'linuxFxVersion' not like 'PHP%' then 'ok'
    when configuration -> 'properties' ->> 'linuxFxVersion' = 'PHP|8.0' then 'ok'
    else 'alarm'
  end as status,
  case
    when b.id is null then a.title || ' is ' || a.kind || ' kind.'
    when configuration -> 'properties' ->> 'linuxFxVersion' not like 'PHP%' then a.name ||  ' not using php version.'
    when configuration -> 'properties' ->> 'linuxFxVersion' = 'PHP|8.0' then a.name || ' using the latest php version.'
    else a.name || ' not using latest php version.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_app_service_web_app as a
  left join all_web_app as b on a.id = b.id,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;
