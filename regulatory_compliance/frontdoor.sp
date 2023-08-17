locals {
  regulatory_compliance_frontdoor_common_tags = {
    service = "Azure/FrontDoor"
  }
}

control "frontdoor_waf_enabled" {
  title       = "Web Application Firewall (WAF) should be enabled for Azure Front Door Service service"
  description = "Deploy Azure Web Application Firewall (WAF) in front of public facing web applications for additional inspection of incoming traffic. Web Application Firewall (WAF) provides centralized protection of your web applications from common exploits and vulnerabilities such as SQL injections, Cross-Site Scripting, local and remote file executions. You can also restrict access to your web applications by countries, IP address ranges, and other http(s) parameters via custom rules."
  query       = query.frontdoor_waf_enabled

  tags = merge(local.regulatory_compliance_frontdoor_common_tags, {
    fundamental_security = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

query "frontdoor_waf_enabled" {
  sql = <<-EOQ
    with frontdoor_with_waf as (
      select
        distinct a.front_door_id
      from
        azure_frontdoor as a,
        jsonb_array_elements(frontend_endpoints) as endpoint
      where
        endpoint -> 'properties' -> 'webApplicationFirewallPolicyLink' ->> 'id' is not null
    )
    select
      a.front_door_id as resource,
      case
        when c.front_door_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when c.front_door_id is not null then a.name || ' WAF enabled.'
        else a.name || ' WAF disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_frontdoor as a
      left join frontdoor_with_waf as c on c.front_door_id = a.front_door_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}
