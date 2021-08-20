with agent_installed_vm as (
  select
    distinct a.vm_id
  from
    azure_compute_virtual_machine as a,
    jsonb_array_elements(extensions) as b
  where
    b ->> 'ExtensionType' = 'DependencyAgentWindows'
    and b ->> 'Publisher' = 'Microsoft.Azure.Monitoring.DependencyAgent'
    and b ->> 'ProvisioningState' = 'Succeeded'
)
select
  -- Required Columns
  a.vm_id as resource,
  case
    when a.os_type <> 'Windows' then 'skip'
    when b.vm_id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when a.os_type <> 'Windows' then a.title || ' is of ' || a.os_type || ' operating syetem.'
    when b.vm_id is not null then a.title || ' have data collection agent installed.'
    else a.title || ' data collection agent not installed.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_compute_virtual_machine as a
  left join agent_installed_vm as b on a.vm_id = b.vm_id,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;