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
  coalesce(sub.display_name, split_part(sa.subscription_id, '-', 5)) as subscription
from
  azure_storage_account sa
  join azure_subscription sub on sub.subscription_id = sa.subscription_id;