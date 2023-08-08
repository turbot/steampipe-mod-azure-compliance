locals {
  regulatory_compliance_eventgrid_common_tags = {
    service = "Azure/EventGrid"
  }
}

control "eventgrid_domain_private_link_used" {
  title       = "Azure Event Grid domains should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your Event Grid domain instead of the entire service, you'll also be protected against data leakage risks."
  query       = query.eventgrid_domain_private_link_used

  tags = merge(local.regulatory_compliance_eventgrid_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "eventgrid_topic_private_link_used" {
  title       = "Azure Event Grid topics should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your Event Grid topic instead of the entire service, you'll also be protected against data leakage risks."
  query       = query.eventgrid_topic_private_link_used

  tags = merge(local.regulatory_compliance_eventgrid_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "eventgrid_domain_restrict_public_access" {
  title       = "Event Grid domains should restrict public network access"
  description = "Ensure that Event Grid Domain public network access is disabled. This control is non-compliant if Event Grid domains have public network access enabled."
  query       = query.eventgrid_domain_restrict_public_access

  tags = merge(local.regulatory_compliance_eventgrid_common_tags, {
    other_checks = "true"
  })
}

control "eventgrid_domain_identity_provider_enabled" {
  title       = "Event Grid domains identity provider should be enabled"
  description = "Ensure that managed identity provider is enabled for Event Grid Domain. This control is non-compliant if Event Grid domain identity provider is disabled."
  query       = query.eventgrid_domain_identity_provider_enabled

  tags = merge(local.regulatory_compliance_eventgrid_common_tags, {
    other_checks = "true"
  })
}

control "eventgrid_topic_local_auth_enabled" {
  title       = "Event Grid topics should have local authentication enabled"
  description = "This control checks if Event Grid topics have local authentication enabled."
  query       = query.eventgrid_topic_local_auth_enabled

  tags = merge(local.regulatory_compliance_eventgrid_common_tags, {
    other_checks = "true"
  })
}

control "eventgrid_topic_identity_provider_enabled" {
  title       = "Event Grid topics identity provider should be enabled"
  description = "Ensure that managed identity provider is enabled for Event Grid Topic. This control is non-compliant if Event Grid topic identity provider is disabled."
  query       = query.eventgrid_topic_identity_provider_enabled

  tags = merge(local.regulatory_compliance_eventgrid_common_tags, {
    other_checks = "true"
  })
}

query "eventgrid_domain_private_link_used" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when public_network_access = 'Enabled' then 'alarm'
        when private_endpoint_connections is null then 'info'
        when private_endpoint_connections @> '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb then 'ok'
        else 'alarm'
      end as status,
      case
        when public_network_access = 'Enabled' then a.name || ' using public networks.'
        when private_endpoint_connections is null then a.name || ' no private link exists.'
        when private_endpoint_connections @> '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb
        then a.name || ' using private link.'
        else a.name || ' not using private link.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_eventgrid_domain a,
      azure_subscription sub;
  EOQ
}

query "eventgrid_topic_private_link_used" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when public_network_access = 'Enabled' then 'alarm'
        when private_endpoint_connections is null then 'info'
        when private_endpoint_connections @> '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb then 'ok'
        else 'alarm'
      end as status,
      case
        when public_network_access = 'Enabled' then a.name || ' using public networks.'
        when private_endpoint_connections is null then a.name || ' no private link exists.'
        when private_endpoint_connections @> '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb
        then a.name || ' using private link.'
        else a.name || ' not using private link.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_eventgrid_topic a,
      azure_subscription sub;
  EOQ
}

query "eventgrid_domain_restrict_public_access" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when public_network_access = 'Enabled' then 'alarm'
        else 'ok'
      end as status,
      case
        when public_network_access = 'Enabled' then a.name || ' publicly accessible.'
        else a.name || ' not publicly accessible.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_eventgrid_domain a,
      azure_subscription sub;
  EOQ
}

query "eventgrid_domain_identity_provider_enabled" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when identity_type = 'None' then 'alarm'
        else 'ok'
      end as status,
      case
        when identity_type = 'None' then a.name || ' identity provider disabled.'
        else a.name || ' identity provider enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_eventgrid_domain a,
      azure_subscription sub;
  EOQ
}

query "eventgrid_topic_local_auth_enabled" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when disable_local_auth then 'ok'
        else 'alarm'
      end as status,
      case
        when disable_local_auth then a.name || ' local authentication disabled.'
        else a.name || ' local authentication enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_eventgrid_domain a,
      azure_subscription sub;
  EOQ
}

query "eventgrid_topic_identity_provider_enabled" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when identity ->> 'type' = 'None' then 'alarm'
        else 'ok'
      end as status,
      case
        when identity ->> 'type' = 'None' then a.name || ' identity provider disabled.'
        else a.name || ' identity provider enabled.'
      end as reason
      --${local.tag_dimensions_sql}
      --${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      --${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_eventgrid_topic a,
      azure_subscription sub;
  EOQ
}