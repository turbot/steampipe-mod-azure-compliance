with sever_with_ad_admin as (
  select
    distinct a.id
  from
    azure_sql_server as a,
    jsonb_array_elements(server_azure_ad_administrator) as ad_admin
  where
    ad_admin ->> 'type' = 'Microsoft.Sql/servers/administrators'
)
select
  -- Required Columns
  a.id as resource,
  case
    when s.id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when s.id is not null then a.name || ' azure AD authentication enabled.'
    else a.name || ' azure AD authentication disabled.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_sql_server as a
  left join sever_with_ad_admin as s on a.id = s.id,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;
