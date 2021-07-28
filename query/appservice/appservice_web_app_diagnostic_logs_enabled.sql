select
  -- Required Columns
  a.id as resource,
  case
    when (a.configuration-> 'properties' -> 'detailedErrorLoggingEnabled')::bool
      and (a.configuration -> 'properties' -> 'httpLoggingEnabled')::bool
      and (a.configuration-> 'properties' -> 'requestTracingEnabled')::bool
    then 'ok'
    else 'alarm'
  end as status,
  case
    when (a.configuration-> 'properties' -> 'detailedErrorLoggingEnabled')::bool
      and (a.configuration -> 'properties' -> 'httpLoggingEnabled')::bool
      and (a.configuration-> 'properties' -> 'requestTracingEnabled')::bool
      then a.name || ' diagnostic logs enabled.'
    else a.title || ' diagnostic logs not enabled for: ' ||
      concat_ws(', ',
        case when not ((a.configuration-> 'properties' -> 'detailedErrorLoggingEnabled')::bool) then 'detailed_Error_Logging_Enabled' end,
        case when not ((a.configuration -> 'properties' -> 'httpLoggingEnabled')::bool) then 'http_logging_enabled' end,
        case when not ((a.configuration-> 'properties' -> 'requestTracingEnabled')::bool) then 'request_tracing_enabled' end
      ) || '.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_app_service_web_app as a,
  azure_subscription sub
where
  sub.subscription_id = a.subscription_id;
