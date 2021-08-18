with agent_installed_vm_scale_set as (
  select
    distinct a.id as vm_id
  from
    azure_compute_virtual_machine_scale_set as a,
    jsonb_array_elements(extensions) as b
  where
    b ->> 'Publisher' = 'Microsoft.EnterpriseCloud.Monitoring'
    and b ->> 'ExtensionType' = any(ARRAY ['MicrosoftMonitoringAgent', 'OmsAgentForLinux'])
    and b ->> 'ProvisioningState' = 'Succeeded'
    and b -> 'Settings' ->> 'workspaceId' is not null
)
select
  -- Required Columns
  a.id as resource,
  case
    when b.vm_id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when b.vm_id is not null then a.title || ' have log analytics agent installed.'
    else a.title || ' log analytics agent not installed.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_compute_virtual_machine_scale_set as a
  left join agent_installed_vm_scale_set as b on a.id = b.vm_id,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;