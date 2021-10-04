select
  -- Required Columns
  ag.id resource,
  case
    when web_application_firewall_configuration is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when web_application_firewall_configuration is not null then ag.name || ' WAF enabled.'
    else ag.name || ' WAF disabled.'
  end as reason,
  -- Additional Dimensions
  ag.resource_group,
  sub.display_name as subscription
from
  azure_application_gateway as ag
  join azure_subscription as sub on sub.subscription_id = ag.subscription_id;