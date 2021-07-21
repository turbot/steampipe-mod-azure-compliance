select
  -- Required Columns
  cosmos.id as resource,
  case
    when document_endpoint like '%Microsoft.AzureCosmosDB%' then 'ok'
    else 'ok'
  end as status,
  case
    when document_endpoint like '%Microsoft.AzureCosmosDB%'  then cosmos.name || ' assoicated with "Microsoft.AzureCosmosDB" service endpoint.'
    else cosmos.name || ' not associated with "Microsoft.AzureCosmosDB" service endpoint.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_cosmosdb_account as cosmos,
  azure_subscription sub
where
  sub.subscription_id = cosmos.subscription_id;