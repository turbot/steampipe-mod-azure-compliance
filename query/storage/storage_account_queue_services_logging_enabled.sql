select
  -- Required Columns
  id as resource,
  case
    when queue_logging_read and queue_logging_write and queue_logging_delete then 'ok'
    else 'alarm'
  end as status,
  case
    when queue_logging_read and queue_logging_write and queue_logging_delete
      then name || ' queue service logging enabled for read, write, delete requests.'
    else name || ' queue service logging not enabled for: ' ||
      concat_ws(', ',
        case when not queue_logging_write then 'write' end,
        case when not queue_logging_read then 'read' end,
        case when not queue_logging_delete then 'delete' end
      ) || ' requests.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_storage_account;