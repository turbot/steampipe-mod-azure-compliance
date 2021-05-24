select
  kv.id as resource,
  case
    when soft_delete_enabled and purge_protection_enabled then 'ok'
    else 'alarm'
  end as status,
  case
    when not soft_delete_enabled and not purge_protection_enabled then name || ' "soft delete" and "do not purge" not enabled.'
    when not soft_delete_enabled then name || ' "soft delete" not enabled.'
    when not purge_protection_enabled then name || ' "do not purge" not enabled.'
    else name || ' "soft delete" and "do not purge" enabled.'
  end as reason,
  resource_group,
  sub.display_name as subscription
from
  azure_key_vault kv,
  azure_subscription sub
where
  sub.subscription_id = kv.subscription_id;