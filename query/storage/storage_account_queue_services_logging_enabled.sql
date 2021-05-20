select
  -- Required Columns
  sa.id as resource,
  case
    when queue_logging_read and queue_logging_write and queue_logging_delete then 'ok'
    else 'alarm'
  end as status,
  case
    when queue_logging_read and queue_logging_write and queue_logging_delete
      then sa.name || ' queue service logging enabled for read, write, delete requests.'
    else sa.name || ' queue service logging not enabled for: ' ||
      concat_ws(', ',
        case when not queue_logging_write then 'write' end,
        case when not queue_logging_read then 'read' end,
        case when not queue_logging_delete then 'delete' end
      ) || ' requests.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_storage_account sa,
  azure_subscription sub
where
  sub.subscription_id = sa.subscription_id;