with all_function_app as (
  select
    id
  from
    azure_app_service_function_app
  where
    exists (
      select
      from
        unnest(regexp_split_to_array(kind, ',')) elem
      where
        elem like 'functionapp%'
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
    when configuration -> 'properties' ->> 'http20Enabled' = 'true' then 'ok'
    else 'alarm'
  end as status,
  case
    when b.id is null then a.title || ' is not a linux function app.'
    when configuration -> 'properties' ->> 'http20Enabled' = 'true' then a.name || ' using the latest HTTP version.'
    else a.name || ' not using latest HTTP version.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_app_service_function_app as a
  left join all_function_app as b on a.id = b.id,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;