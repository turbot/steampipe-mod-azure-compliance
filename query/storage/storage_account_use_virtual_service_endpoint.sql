with storage_account_subnet as (
select
  name,
  rule ->> 'id' as id
from
  azure_storage_account,
  jsonb_array_elements(virtual_network_rules) as rule
)
select
  -- Required Columns
  subnet.id as resource,
  case
    when endpoints ->> 'service'  like '%Microsoft.Storage%' then 'ok'
    else 'alarm'
  end as status,
  case
    when endpoints ->> 'service' like '%Microsoft.Storage%' then storage_account_subnet.name || ' assoicated with virtual service ' || subnet.service_endpoints || '.'
    else storage_account_subnet.name || ' not assoicated with virtual service endpoint.' 
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  storage_account_subnet,
  azure_subnet as subnet,
  azure_subscription as sub,
  jsonb_array_elements(service_endpoints) as endpoints
where
  sub.subscription_id = subnet.subscription_id;