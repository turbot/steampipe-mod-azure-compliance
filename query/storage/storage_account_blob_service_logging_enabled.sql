select
  -- Required Columns
  sa.id as resource,
  case
    when not (sa.blob_service_logging ->> 'Read') :: boolean
    or not (sa.blob_service_logging ->> 'Write') :: boolean
    or not (sa.blob_service_logging ->> 'Delete') :: boolean then 'alarm'
    else 'ok'
  end as status,
  case
    when not (sa.blob_service_logging ->> 'Read') :: boolean
    or not (sa.blob_service_logging ->> 'Write') :: boolean
    or not (sa.blob_service_logging ->> 'Delete') :: boolean then name || ' blob service logging not enabled for ' ||
      concat_ws(', ',
        case when not (sa.blob_service_logging ->> 'Write') :: boolean then 'write' end,
        case when not (sa.blob_service_logging ->> 'Read') :: boolean then 'read' end,
        case when not (sa.blob_service_logging ->> 'Delete') :: boolean then 'delete' end
      ) || ' requests.'
    else name || ' blob service logging enabled for read, write, delete requests.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_storage_account sa,
  azure_subscription sub
where
  sub.subscription_id = sa.subscription_id;