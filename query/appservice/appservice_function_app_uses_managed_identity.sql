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
)
select
  -- Required Columns
  a.id as resource,
  case
    when b.id is null then 'skip'
    when
      configuration -> 'properties' ->> 'xManagedServiceIdentityId' is not null
      or configuration -> 'properties' ->> 'managedServiceIdentityId' is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when b.id is null then a.title || ' is ' || a.kind || ' kind.'
    when
      configuration -> 'properties' ->> 'xManagedServiceIdentityId' is not null
      or configuration -> 'properties' ->> 'managedServiceIdentityId' is not null
      then a.name || ' uses managed identity.'
    else a.name || ' not uses managed identity'
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