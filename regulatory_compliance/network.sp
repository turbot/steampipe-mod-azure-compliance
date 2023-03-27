locals {
  regulatory_compliance_network_common_tags = {
    service = "Azure/Network"
  }
}

control "network_security_group_remote_access_restricted" {
  title       = "Management ports should be closed on your virtual machines"
  description = "Open remote management ports are exposing your VM to a high level of risk from Internet-based attacks. These attacks attempt to brute force credentials to gain admin access to the machine."
  query       = query.network_security_group_remote_access_restricted

  tags = merge(local.regulatory_compliance_network_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "network_security_group_rdp_access_restricted" {
  title       = "Windows machines should meet requirements for 'User Rights Assignment'"
  description = "Windows machines should have the specified Group Policy settings in the category 'User Rights Assignment' for allowing log on locally, RDP, access from the network, and many other user activities. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope."
  query       = query.network_security_group_rdp_access_restricted

  tags = merge(local.regulatory_compliance_network_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "network_watcher_enabled" {
  title       = "Network Watcher should be enabled"
  description = "Network Watcher is a regional service that enables you to monitor and diagnose conditions at a network scenario level in, to, and from Azure. Scenario level monitoring enables you to diagnose problems at an end to end network level view. It is required to have a network watcher resource group to be created in every region where a virtual network is present. An alert is enabled if a network watcher resource group is not available in a particular region."
  query       = query.network_watcher_enabled

  tags = merge(local.regulatory_compliance_network_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "network_security_group_subnet_associated" {
  title       = "Subnets should be associated with a Network Security Group"
  description = "This policy denies if a gateway subnet is configured with a network security group. Assigning a network security group to a gateway subnet will cause the gateway to stop functioning."
  query       = query.network_security_group_subnet_associated

  tags = merge(local.regulatory_compliance_network_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "network_security_group_not_configured_gateway_subnets" {
  title       = "Gateway subnets should not be configured with a network security group"
  description = "Protect your subnet from potential threats by restricting access to it with a Network Security Group (NSG). NSGs contain a list of Access Control List (ACL) rules that allow or deny network traffic to your subnet."
  query       = query.network_security_group_not_configured_gateway_subnets

  tags = merge(local.regulatory_compliance_network_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "network_watcher_in_regions_with_virtual_network" {
  title       = "Deploy network watcher when virtual networks are created"
  description = "This policy creates a network watcher resource in regions with virtual networks. You need to ensure existence of a resource group named networkWatcherRG, which will be used to deploy network watcher instances."
  query       = query.network_watcher_in_regions_with_virtual_network

  tags = merge(local.regulatory_compliance_network_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "network_security_group_diagnostic_setting_deployed" {
  title       = "Deploy Diagnostic Settings for Network Security Groups"
  description = "This policy automatically deploys diagnostic settings to network security groups. A storage account with name '{storagePrefixParameter}{NSGLocation}' will be automatically created."
  query       = query.network_security_group_diagnostic_setting_deployed

  tags = merge(local.regulatory_compliance_network_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "application_gateway_waf_enabled" {
  title       = "Web Application Firewall (WAF) should be enabled for Application Gateway"
  description = "Deploy Azure Web Application Firewall (WAF) in front of public facing web applications for additional inspection of incoming traffic. Web Application Firewall (WAF) provides centralized protection of your web applications from common exploits and vulnerabilities such as SQL injections, Cross-Site Scripting, local and remote file executions. You can also restrict access to your web applications by countries, IP address ranges, and other http(s) parameters via custom rules."
  query       = query.application_gateway_waf_enabled

  tags = merge(local.regulatory_compliance_network_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "network_ddos_enabled" {
  title       = "Azure DDoS Protection Standard should be enabled"
  description = "DDoS protection standard should be enabled for all virtual networks with a subnet that is part of an application gateway with a public IP."
  query       = query.network_ddos_enabled

  tags = merge(local.regulatory_compliance_network_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "network_virtual_network_gateway_no_basic_sku" {
  title       = "Virtual network gateways should use standard SKUs as a minimum"
  description = "The use of Basic or Free SKUs in Azure whilst cost effective have significant limitations in terms of what can be monitored and what support can be realized from Microsoft. Typically, these SKU’s do not have a service SLA and Microsoft will usually refuse to provide support for them. Consequently Basic/Free SKUs should never be used for production workloads."
  query       = query.network_virtual_network_gateway_no_basic_sku

  tags = merge(local.regulatory_compliance_network_common_tags, {
    cis = "true"
  })
}

control "network_lb_no_basic_sku" {
  title       = "Network load balancers should use standard SKUs as a minimum"
  description = "The use of Basic or Free SKUs in Azure whilst cost effective have significant limitations in terms of what can be monitored and what support can be realized from Microsoft. Typically, these SKU’s do not have a service SLA and Microsoft will usually refuse to provide support for them. Consequently Basic/Free SKUs should never be used for production workloads."
  query       = query.network_lb_no_basic_sku

  tags = merge(local.regulatory_compliance_network_common_tags, {
    cis = "true"
  })
}

control "network_public_ip_no_basic_sku" {
  title       = "Network public IPs should use standard SKUs as a minimum"
  description = "The use of Basic or Free SKUs in Azure whilst cost effective have significant limitations in terms of what can be monitored and what support can be realized from Microsoft. Typically, these SKU’s do not have a service SLA and Microsoft will usually refuse to provide support for them. Consequently Basic/Free SKUs should never be used for production workloads."
  query       = query.network_public_ip_no_basic_sku

  tags = merge(local.regulatory_compliance_network_common_tags, {
    cis = "true"
  })
}

query "network_security_group_remote_access_restricted" {
  sql = <<-EOQ
    with network_sg as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules) sg,
        jsonb_array_elements_text(sg -> 'properties' -> 'destinationPortRanges' || (sg -> 'properties' -> 'destinationPortRange') :: jsonb) dport,
        jsonb_array_elements_text(sg -> 'properties' -> 'sourceAddressPrefixes' || (sg -> 'properties' -> 'sourceAddressPrefix') :: jsonb) sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and (sg -> 'properties' ->> 'protocol' ilike 'TCP' or sg -> 'properties' ->> 'protocol' = '*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport in ('22', '3389', '*')
          or (
            dport like '%-%'
            and (
              (
                split_part(dport, '-', 1) :: integer <= 3389
                and split_part(dport, '-', 2) :: integer >= 3389
              )
              or (
                split_part(dport, '-', 1) :: integer <= 22
                and split_part(dport, '-', 2) :: integer >= 22
              )
            )
          )
        )
    )
    select
      sg.id resource,
      case
        when nsg.sg_name is null then 'ok'
        else 'alarm'
      end as status,
      case
        when nsg.sg_name is null then sg.title || ' restricts remote access from internet.'
        else sg.title || ' allows remote access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group as sg
      left join network_sg as nsg on nsg.sg_name = sg.name
      join azure_subscription as sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_security_group_rdp_access_restricted" {
  sql = <<-EOQ
    with network_sg as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules) sg,
        jsonb_array_elements_text(sg -> 'properties' -> 'destinationPortRanges' || (sg -> 'properties' -> 'destinationPortRange') :: jsonb) dport,
        jsonb_array_elements_text(sg -> 'properties' -> 'sourceAddressPrefixes' || (sg -> 'properties' -> 'sourceAddressPrefix') :: jsonb) sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and (sg -> 'properties' ->> 'protocol' ilike 'TCP' or sg -> 'properties' ->> 'protocol' = '*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport in ('3389', '*')
          or (
            dport like '%-%'
            and split_part(dport, '-', 1) :: integer <= 3389
            and split_part(dport, '-', 2) :: integer >= 3389
          )
        )
    )
    select
      sg.id resource,
      case
        when nsg.sg_name is null then 'ok'
        else 'alarm'
      end as status,
      case
        when nsg.sg_name is null
          then sg.title || ' restricts RDP access from internet.'
        else sg.title || ' allows RDP access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}      
    from
      azure_network_security_group sg
      left join network_sg nsg on nsg.sg_name = sg.name
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_watcher_enabled" {
  sql = <<-EOQ
    select
      loc.id resource,
      case
        when watcher.id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when watcher.id is null then 'Network watcher not enabled in ' || loc.name || '.'
        else 'Network watcher enabled in ' || loc.name || '.'
      end as reason,
      loc.name
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_pricing_qualifier_sql, "__QUALIFIER__", "loc.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_location loc
      left join azure_network_watcher watcher on watcher.region = loc.name
      join azure_subscription sub on sub.subscription_id = loc.subscription_id;
  EOQ
}

query "network_security_group_subnet_associated" {
  sql = <<-EOQ
    select
      sg.id resource,
      case
        when subnets is null then 'alarm'
        else 'ok'
      end as status,
      case
        when subnets is null then name || ' not associated with subnet.'
        else name || ' associated with ' || split_part(rtrim((subnet -> 'id') :: text, '"'), '/subnets/',2) || '.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group as sg
      join azure_subscription as sub on sub.subscription_id = sg.subscription_id
      left join jsonb_array_elements(subnets) as subnet on true;
  EOQ
}