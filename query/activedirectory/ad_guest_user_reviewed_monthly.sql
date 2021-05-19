select
  -- Required Columns
  display_name as resource,
  case
    when not account_enabled then 'alarm'
    when (additional_properties ->> 'createdDateTime')::timestamp <= (current_date - interval '30' day) then 'alarm'
    else 'ok'
  end status,
  case
    when not account_enabled
      then 'Guest user ''' || display_name || ''' inactive.'
      else 'Guest user ''' || display_name || ''' was created ' || extract(day from current_timestamp - (additional_properties ->> 'createdDateTime')::timestamp) || ' days ago.'
  end reason
from
  azure_ad_user
where
  user_type = 'Guest';