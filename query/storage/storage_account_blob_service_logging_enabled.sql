select
  -- Required Columns
  id as resource,
  case
    when not (blob_service_logging ->> 'Read') :: boolean
    or not (blob_service_logging ->> 'Write') :: boolean
    or not (blob_service_logging ->> 'Delete') :: boolean then 'alarm'
    else 'ok'
  end as status,
  case
    when not (blob_service_logging ->> 'Read') :: boolean
    or not (blob_service_logging ->> 'Write') :: boolean
    or not (blob_service_logging ->> 'Delete') :: boolean then name || ' blob service logging not enabled for ' ||
      concat_ws(', ',
        case when not (blob_service_logging ->> 'Write') :: boolean then 'write' end,
        case when not (blob_service_logging ->> 'Read') :: boolean then 'read' end,
        case when not (blob_service_logging ->> 'Delete') :: boolean then 'delete' end
      ) || ' requests.'
    else name || ' blob service logging enabled for read, write, delete requests.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_storage_account;