select
  -- Required Columns
  a.id as resource,
  case
    when fabric_settings @> '[{"parameters":[{"value": "EncryptAndSign"}]}]'::jsonb then 'ok'
    else 'alarm'
  end as status,
  case
    when fabric_settings @> '[{"parameters":[{"value": "EncryptAndSign"}]}]'::jsonb then a.name || ' ClusterProtectionLevel property set to EncryptAndSign.'
    else  a.name || ' ClusterProtectionLevel property not set to EncryptAndSign.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_service_fabric_cluster a,
  azure_subscription sub;
