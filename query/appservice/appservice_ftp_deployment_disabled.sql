  select
    -- Required Column
    fa.id as resource,
    case
      when configuration -> 'properties' ->> 'ftpsState' = 'AllAllowed' then 'alarm'
      else 'ok'
    end as status,
    case
      when configuration -> 'properties' ->> 'ftpsState' = 'AllAllowed' then name || ' FTP deployments enabled.'
      else name || ' FTP deployments disabled.'
    end as reason,
    -- Additional Dimensions
    resource_group,
    sub.display_name as subscription
  from
    azure_app_service_function_app fa,
    azure_subscription sub
  where
    sub.subscription_id = fa.subscription_id
union
  select
    -- Required Column
    wa.id as resource,
    case
      when configuration -> 'properties' ->> 'ftpsState' = 'AllAllowed' then 'alarm'
      else 'ok'
    end as status,
    case
      when configuration -> 'properties' ->> 'ftpsState' = 'AllAllowed' then name || ' FTP deployments enabled.'
      else name || ' FTP deployments disabled.'
    end as reason,
    -- Additional Dimensions
    resource_group,
    sub.display_name as subscription
  from
    azure_app_service_web_app wa,
    azure_subscription sub
  where
    sub.subscription_id = wa.subscription_id;