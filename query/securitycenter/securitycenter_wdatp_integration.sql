select
  -- Required Columns
  sc_sett.id as resource,
  case
    when enabled then 'ok'
    else 'alarm'
  end as status,
  case
    when enabled then 'Microsoft Cloud App Security (MCAS) integrated with Security Center.'
    else 'Microsoft Cloud App Security (MCAS) not integrated with Security Center.'
  end as reason,
  -- Additional Dimension
  sub.display_name as subscription
from
  azure_security_center_setting sc_sett
  right join azure_subscription sub on sc_sett.subscription_id = sub.subscription_id
where
  name = 'WDATP';