(
  select
    -- Required Columns
    a.id as resource,
    case
      when security_profile -> 'encryptionAtHost' = 'true' then 'ok'
      else 'alarm'
    end as status,
    case
      when security_profile -> 'encryptionAtHost' = 'true' then a.name || ' encryption at host enabled.'
      else a.name || ' encryption at host disabled.'
    end as reason,
    -- Additional Dimensions
    a.resource_group,
    sub.display_name as subscription
  from
    azure_compute_virtual_machine as a,
    azure_subscription as sub
  where
    sub.subscription_id = a.subscription_id
)
union
(
  select
    -- Required Columns
    a.id as resource,
    case
      when virtual_machine_security_profile -> 'encryptionAtHost' = 'true' then 'ok'
      else 'alarm'
    end as status,
    case
      when virtual_machine_security_profile -> 'encryptionAtHost' = 'true' then a.name || ' encryption at host enabled.'
      else a.name || ' encryption at host disabled.'
    end as reason,
    -- Additional Dimensions
    a.resource_group,
    sub.display_name as subscription
  from
    azure_compute_virtual_machine_scale_set as a,
    azure_subscription as sub
  where
    sub.subscription_id = a.subscription_id
)