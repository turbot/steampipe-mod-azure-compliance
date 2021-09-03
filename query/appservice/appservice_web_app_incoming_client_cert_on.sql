with all_ebapp as (
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
        elem like 'api*'
  )
)
select
  -- Required Column
  app.id as resource,
  case
    when
      configuration -> 'properties' -> 'xManagedServiceIdentityId' is not null
      or configuration -> 'properties' -> 'managedServiceIdentityId' is not null
      then 'ok'
    else 'alarm'
  end as status,
  case
    when
      configuration -> 'properties' -> 'xManagedServiceIdentityId' is not null
      or configuration -> 'properties' -> 'managedServiceIdentityId' is not null
      then app.name || ' uses managed identity.'
    else app.name || ' not uses managed identity'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_app_service_web_app as app,
  azure_subscription as sub
where
  sub.subscription_id = app.subscription_id;