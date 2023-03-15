with application_insights as (
  select
    subscription_id,
    count(*) as no_application_insight
  from
    azure_application_insight
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
    when i.subscription_id is null then sub.display_name || ' does not have application insights configured.'
    else sub.display_name || ' have ' || no_application_insight || ' application insights configured.'
  end as reason,
  -- Additional Dimensions
  sub.display_name as subscription
from
  azure_subscription as sub
  left join application_insights as i on i.subscription_id = sub.subscription_id;