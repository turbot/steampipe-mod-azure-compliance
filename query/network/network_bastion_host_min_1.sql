with bastion_hosts as (
  select
    subscription_id,
    count(*) as no_bastion_host
  from
    azure_bastion_host
  group by
    subscription_id
)
select
  -- Required Columns
  sub.id as resource,
  case
    when i.subscription_id is null then 'alarm'
    else 'ok'
  end as status,
  case
    when i.subscription_id is null then sub.display_name || ' does not have bastion host.'
    else sub.display_name || ' has ' || no_bastion_host || ' bastion host(s).'
  end as reason,
  -- Additional Dimensions
  sub.display_name as subscription
from
  azure_subscription as sub
  left join bastion_hosts as i on i.subscription_id = sub.subscription_id;
