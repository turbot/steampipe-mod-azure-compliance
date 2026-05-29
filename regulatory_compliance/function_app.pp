locals {
  regulatory_compliance_function_app_common_tags = {
    service = "Azure/Function App"
  }
}

control "function_app_https_only" {
  title       = "Function App should only be accessible over HTTPS"
  description = "Azure Function should not be accessible over HTTP. Enforcing HTTPS ensures that all communication between clients and the Function App is encrypted, protecting sensitive data from interception and tampering during transmission."
  query       = query.function_app_https_only

  tags = merge(local.regulatory_compliance_sql_common_tags, {})
}

query "function_app_https_only" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when https_only then 'ok'
        else 'alarm'
      end as status,
      case
        when https_only then ' HTTPS-only is enabled'
        else ' HTTPS-only is disabled'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_function_app s,
      azure_subscription sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}
