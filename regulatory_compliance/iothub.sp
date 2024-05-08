locals {
  regulatory_compliance_iothub_common_tags = {
    service = "Azure/IoTHub"
  }
}

control "iot_hub_logging_enabled" {
  title       = "Resource logs in IoT Hub should be enabled"
  description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised."
  query       = query.iot_hub_logging_enabled

  tags = merge(local.regulatory_compliance_iothub_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "iot_hub_private_link_used" {
  title       = "IoT Hub device provisioning service instances should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to the IoT Hub device provisioning service, data leakage risks are reduced."
  query       = query.iot_hub_private_link_used

  tags = merge(local.regulatory_compliance_iothub_common_tags, {
    nist_sp_800_171_r2   = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "iot_hub_encrypted_with_cmk" {
  title       = "IoT Hub device provisioning service data should be encrypted using customer-managed keys (CMK)"
  description = "Use customer-managed keys to manage the encryption at rest of your IoT Hub device provisioning service. The data is automatically encrypted at rest with service-managed keys, but customer-managed keys (CMK) are commonly required to meet regulatory compliance standards. CMKs enable the data to be encrypted with an Azure Key Vault key created and owned by you. Learn more about CMK encryption at https://aka.ms/dps/CMK."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_iothub_common_tags, {
    nist_sp_800_171_r2   = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

query "iot_hub_logging_enabled" {
  sql = <<-EOQ
    with logging_details as (
      select
        distinct id as id
      from
        azure_iothub,
        jsonb_array_elements(diagnostic_settings) setting,
        jsonb_array_elements(setting -> 'properties' -> 'logs') log
      where
        diagnostic_settings is not null
        and (
          (
            (log ->> 'enabled') :: boolean
            and (log -> 'retentionPolicy' ->> 'enabled') :: boolean
            and (log -> 'retentionPolicy') :: JSONB ? 'days'
          )
          or
          (
            (log ->> 'enabled') :: boolean
            and log -> 'retentionPolicy' ->> 'enabled' <> 'true'
          )
        )
    )
    select
      a.id as resource,
      case
        when a.diagnostic_settings is null then 'alarm'
        when l.id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.diagnostic_settings is null then a.name || ' logging disabled.'
        when l.id is not null then a.name || ' logging enabled.'
        else a.name || ' logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_iothub as a
      left join logging_details as l on a.id = l.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "iot_hub_private_link_used" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        -- Only applicable to standard tier
        when sku_tier = 'Basic' then 'skip'
        when pec -> 'properties' -> 'privateLinkServiceConnectionState' ->> 'status' = 'Approved' then 'ok'
        else 'alarm'
      end as status,
      case
        when sku_tier = 'Basic' then a.name || ' is of ' || sku_tier || ' tier.'
        when pec -> 'properties' -> 'privateLinkServiceConnectionState' ->> 'status' = 'Approved' then a.name || ' using private link.'
        else a.name || ' not using private link.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_iothub a,
      jsonb_array_elements(private_endpoint_connections) as pec,
      azure_subscription sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}
