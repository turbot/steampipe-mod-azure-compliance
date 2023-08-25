locals {
  regulatory_compliance_appconfiguration_common_tags = {
    service = "Azure/AppConfiguration"
  }
}

control "app_configuration_private_link_used" {
  title       = "App Configuration should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The private link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your app configuration instances instead of the entire service, you'll also be protected against data leakage risks."
  query       = query.app_configuration_private_link_used

  tags = merge(local.regulatory_compliance_appconfiguration_common_tags, {
    controls_by_service  = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "app_configuration_sku_standard" {
  title       = "App Configuration should use standard SKU"
  description = "Ensure that App Configuration uses standard SKU tier. This control is non-compliant if App Configuration does not use standard SKU."
  query       = query.app_configuration_sku_standard

  tags = merge(local.regulatory_compliance_appconfiguration_common_tags, {
    controls_by_service = "true"
  })
}

control "app_configuration_encryption_enabled" {
  title       = "App Configuration encryption should be enabled"
  description = "Enabling App Configuration encryption helps protect and safeguard your data to meet your organizational security and compliance commitments."
  query       = query.app_configuration_encryption_enabled

  tags = merge(local.regulatory_compliance_appconfiguration_common_tags, {
    controls_by_service = "true"
  })
}

query "app_configuration_private_link_used" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        -- Only applicable to standard tier
        when sku_name = 'free' then 'skip'
        -- All networks, including the internet and private endpoints, can access this resource
        -- Checking if all network enabled and no private endpoint then it's public access
        when public_network_access = 'Enabled' and private_endpoint_connections is null then 'alarm'
        when private_endpoint_connections @> '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb then 'ok'
        else 'alarm'
      end as status,
      case
        when sku_name = 'free' then a.name || ' is of ' || sku_name || ' tier.'
        when public_network_access = 'Enabled' and private_endpoint_connections is null then ' using public networks.'
        when private_endpoint_connections @> '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb then a.name || ' using private link.'
        else a.name || ' not using private link.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_configuration as a,
      azure_subscription as sub;
  EOQ
}

query "app_configuration_sku_standard" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when sku_name = 'standard' then 'ok'
        else 'alarm'
      end as status,
        a.name || ' has ' || sku_name || ' SKU tier.' as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_configuration as a,
      azure_subscription as sub;
  EOQ
}

query "app_configuration_encryption_enabled" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when encryption -> 'keyVaultProperties' ->> 'keyIdentifier' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when encryption -> 'keyVaultProperties' ->> 'keyIdentifier' is not null then a.name ||  'encryption enabled.'
        else a.name || ' encryption disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_configuration as a,
      azure_subscription as sub;
  EOQ
}
