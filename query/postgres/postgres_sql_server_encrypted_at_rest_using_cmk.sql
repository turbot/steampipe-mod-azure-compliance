with pgql_server_encrypted as (
  select
    distinct i.id as id
  from
    azure_mysql_server as i,
    jsonb_array_elements(server_keys) a
    where
      a ->> 'serverKeyType' = 'AzureKeyVault'
      and a ->> 'uri' is not null
)
select
  -- Required Columns
  s.id as resource,
  case
    when a.id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when a.id is not null then s.title || ' encrypted with CMK.'
    else s.title || ' not encrypted with CMK.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_postgresql_server as s
  left join pgql_server_encrypted as a on s.id = a.id,
  azure_subscription as sub
where
  sub.subscription_id = s.subscription_id;