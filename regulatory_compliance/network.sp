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
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_2017     = "true"
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
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "network_security_group_subnet_associated" {
  title       = "Subnets should be associated with a Network Security Group"
  description = "This policy denies if a gateway subnet is configured with a network security group. Assigning a network security group to a gateway subnet will cause the gateway to stop functioning."
  query       = query.network_security_group_subnet_associated

  tags = merge(local.regulatory_compliance_network_common_tags, {
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_2017     = "true"
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
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_2017     = "true"
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

  tags = local.regulatory_compliance_network_common_tags
}

control "network_lb_no_basic_sku" {
  title       = "Network load balancers should use standard SKUs as a minimum"
  description = "The use of Basic or Free SKUs in Azure whilst cost effective have significant limitations in terms of what can be monitored and what support can be realized from Microsoft. Typically, these SKU’s do not have a service SLA and Microsoft will usually refuse to provide support for them. Consequently Basic/Free SKUs should never be used for production workloads."
  query       = query.network_lb_no_basic_sku

  tags = local.regulatory_compliance_network_common_tags
}

control "network_public_ip_no_basic_sku" {
  title       = "Network public IPs should use standard SKUs as a minimum"
  description = "The use of Basic or Free SKUs in Azure whilst cost effective have significant limitations in terms of what can be monitored and what support can be realized from Microsoft. Typically, these SKU’s do not have a service SLA and Microsoft will usually refuse to provide support for them. Consequently Basic/Free SKUs should never be used for production workloads."
  query       = query.network_public_ip_no_basic_sku

  tags = local.regulatory_compliance_network_common_tags
}

control "network_subnet_protected_by_firewall" {
  title       = "All Internet traffic should be routed via your deployed Azure Firewall"
  description = "Azure Security Center has identified that some of your subnets aren't protected with a next generation firewall. Protect your subnets from potential threats by restricting access to them with Azure Firewall or a supported next generation firewall."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_network_common_tags, {
    nist_sp_800_53_rev_5 = "true"
    rbi_itf_nbfc_2017    = "true"
  })
}

control "network_bastion_host_min_1" {
  title       = "Ensure an Azure Bastion Host exists"
  description = "The Azure Bastion service allows secure remote access to Azure Virtual Machines over the Internet without exposing remote access protocol ports and services directly to the Internet. The Azure Bastion service provides this access using TLS over 443/TCP, and subscribes to hardened configurations within an organization's Azure Active Directory service."
  query       = query.network_bastion_host_min_1

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_https_access_restricted" {
  title       = "Ensure that HTTP(S) access from the Internet is evaluated and restricted"
  description = "Network security groups should be periodically evaluated for port misconfigurations. Where certain ports and protocols may be exposed to the Internet, they should be evaluated for necessity and restricted wherever they are not explicitly required and narrowly configured."
  query       = query.network_security_group_https_access_restricted

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_ssh_access_restricted" {
  title       = "Ensure that SSH access is restricted from the internet"
  description = "Disable SSH access on network security groups from the Internet."
  query       = query.network_security_group_ssh_access_restricted

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_udp_service_restricted" {
  title       = "Ensure that UDP Services are restricted from the Internet"
  description = "Disable Internet exposed UDP ports on network security groups."
  query       = query.network_security_group_udp_service_restricted

  tags = local.regulatory_compliance_network_common_tags
}


control "network_sg_flowlog_retention_period_greater_than_90" {
  title       = "Ensure that Network Security Group Flow Log retention period is 'greater than 90 days'"
  description = "Network Security Group Flow Logs should be enabled and the retention period is set to greater than or equal to 90 days."
  query       = query.network_sg_flowlog_retention_period_greater_than_90

  tags = local.regulatory_compliance_network_common_tags
}

control "network_network_peering_connected" {
  title       = "Virtual network network peering should be in connected state"
  description = "This control ensures whether virtual network network peering is in connetecd state. This contol is non-compliant if network peering is not in connected state."
  query       = query.network_network_peering_connected

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_restrict_inbound_udp_port_445" {
  title       = "Network security groups should restrict inbound UDP port 445 access from internet"
  description = "Network security group provide stateful filtering of inbound/outbound network traffic to Azure resources. It is recommended that no network security group allows unrestricted inbound access to UDP port 445."
  query       = query.network_security_group_restrict_inbound_udp_port_445

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_restrict_inbound_tcp_port_20" {
  title       = "Network security groups should restrict inbound TCP port 20 access from internet"
  description = "Network security group provide stateful filtering of inbound/outbound network traffic to Azure resources. It is recommended that no network security group allows unrestricted inbound access to TCP port 20."
  query       = query.network_security_group_restrict_inbound_tcp_port_20

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_restrict_inbound_tcp_port_21" {
  title       = "Network security groups should restrict inbound TCP port 21 access from internet"
  description = "Network security group provide stateful filtering of inbound/outbound network traffic to Azure resources. It is recommended that no network security group allows unrestricted inbound access to TCP port 20."
  query       = query.network_security_group_restrict_inbound_tcp_port_21

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_restrict_inbound_icmp_port" {
  title       = "Network security groups should restrict inbound ICMP port access from internet"
  description = "Network security group provide stateful filtering of inbound/outbound network traffic to Azure resources. It is recommended that no network security group allows unrestricted inbound access to ICMP port."
  query       = query.network_security_group_restrict_inbound_icmp_port

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_restrict_inbound_tcp_port_4333" {
  title       = "Network security groups should restrict inbound TCP port 4333 access from internet"
  description = "Network security group provide stateful filtering of inbound/outbound network traffic to Azure resources. It is recommended that no network security group allows unrestricted inbound access to TCP port 4333."
  query       = query.network_security_group_restrict_inbound_tcp_port_4333

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_restrict_inbound_tcp_port_3306" {
  title       = "Network security groups should restrict inbound TCP port 3306 access from internet"
  description = "Network security group provide stateful filtering of inbound/outbound network traffic to Azure resources. It is recommended that no network security group allows unrestricted inbound access to TCP port 3306."
  query       = query.network_security_group_restrict_inbound_tcp_port_3306

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_restrict_inbound_tcp_port_53" {
  title       = "Network security groups should restrict inbound TCP port 53 access from internet"
  description = "Network security group provide stateful filtering of inbound/outbound network traffic to Azure resources. It is recommended that no network security group allows unrestricted inbound access to TCP port 53."
  query       = query.network_security_group_restrict_inbound_tcp_port_53

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_restrict_inbound_udp_port_53" {
  title       = "Network security groups should restrict inbound UDP port 53 access from internet"
  description = "Network security group provide stateful filtering of inbound/outbound network traffic to Azure resources. It is recommended that no network security group allows unrestricted inbound access to UDP port 53."
  query       = query.network_security_group_restrict_inbound_udp_port_53

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_restrict_inbound_udp_port_137" {
  title       = "Network security groups should restrict inbound UDP port 137 access from internet"
  description = "Network security group provide stateful filtering of inbound/outbound network traffic to Azure resources. It is recommended that no network security group allows unrestricted inbound access to UDP port 137."
  query       = query.network_security_group_restrict_inbound_udp_port_137

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_restrict_inbound_udp_port_138" {
  title       = "Network security groups should restrict inbound UDP port 137 access from internet"
  description = "Network security group provide stateful filtering of inbound/outbound network traffic to Azure resources. It is recommended that no network security group allows unrestricted inbound access to UDP port 137."
  query       = query.network_security_group_restrict_inbound_udp_port_138

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_restrict_inbound_tcp_port_5432" {
  title       = "Network security groups should restrict inbound TCP port 5432 access from internet"
  description = "Network security group provide stateful filtering of inbound/outbound network traffic to Azure resources. It is recommended that no network security group allows unrestricted inbound access to TCP port 5432."
  query       = query.network_security_group_restrict_inbound_tcp_port_5432

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_restrict_inbound_tcp_port_25" {
  title       = "Network security groups should restrict inbound TCP port 25 access from internet"
  description = "Network security group provide stateful filtering of inbound/outbound network traffic to Azure resources. It is recommended that no network security group allows unrestricted inbound access to TCP port 25."
  query       = query.network_security_group_restrict_inbound_tcp_port_25

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_restrict_inbound_tcp_port_1433" {
  title       = "Network security groups should restrict inbound TCP port 1433 access from internet"
  description = "Network security group provide stateful filtering of inbound/outbound network traffic to Azure resources. It is recommended that no network security group allows unrestricted inbound access to TCP port 1433."
  query       = query.network_security_group_restrict_inbound_tcp_port_1433

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_restrict_inbound_udp_port_1434" {
  title       = "Network security groups should restrict inbound UDP port 1434 access from internet"
  description = "Network security group provide stateful filtering of inbound/outbound network traffic to Azure resources. It is recommended that no network security group allows unrestricted inbound access to UDP port 1434."
  query       = query.network_security_group_restrict_inbound_udp_port_1434

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_restrict_inbound_tcp_port_23" {
  title       = "Network security groups should restrict inbound TCP port 23 access from internet"
  description = "Network security group provide stateful filtering of inbound/outbound network traffic to Azure resources. It is recommended that no network security group allows unrestricted inbound access to TCP port 23."
  query       = query.network_security_group_restrict_inbound_tcp_port_23

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_restrict_inbound_tcp_port_5500" {
  title       = "Network security groups should restrict inbound TCP port 5500 access from internet"
  description = "Network security group provide stateful filtering of inbound/outbound network traffic to Azure resources. It is recommended that no network security group allows unrestricted inbound access to TCP port 5500."
  query       = query.network_security_group_restrict_inbound_tcp_port_5500

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_restrict_inbound_tcp_port_5900" {
  title       = "Network security groups should restrict inbound TCP port 5900 access from internet"
  description = "Network security group provide stateful filtering of inbound/outbound network traffic to Azure resources. It is recommended that no network security group allows unrestricted inbound access to TCP port 5900."
  query       = query.network_security_group_restrict_inbound_tcp_port_5900

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_restrict_inbound_tcp_port_135" {
  title       = "Network security groups should restrict inbound TCP port 135 access from internet"
  description = "Network security group provide stateful filtering of inbound/outbound network traffic to Azure resources. It is recommended that no network security group allows unrestricted inbound access to TCP port 135."
  query       = query.network_security_group_restrict_inbound_tcp_port_135

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_restrict_inbound_tcp_port_445" {
  title       = "Network security groups should restrict inbound TCP port 445 access from internet"
  description = "Network security group provide stateful filtering of inbound/outbound network traffic to Azure resources. It is recommended that no network security group allows unrestricted inbound access to TCP port 445."
  query       = query.network_security_group_restrict_inbound_tcp_port_445

  tags = local.regulatory_compliance_network_common_tags
}

control "network_security_group_outbound_access_restricted" {
  title       = "Network security groups should restrict outbound access from internet"
  description = "Network security group provide stateful filtering of inbound/outbound network traffic to Azure resources. It is recommended that no network security group allows unrestricted outbound access."
  query       = query.network_security_group_outbound_access_restricted

  tags = local.regulatory_compliance_network_common_tags
}

control "network_sg_flowlog_enabled" {
  title       = "Flow logs should be configured for every network security group"
  description = "Audit for network security groups to verify if flow logs are configured. Enabling flow logs allows to log information about IP traffic flowing through network security group. It can be used for optimizing network flows, monitoring throughput, verifying compliance, detecting intrusions and more."
  query       = query.network_sg_flowlog_enabled

  tags = merge(local.regulatory_compliance_network_common_tags, {
    rbi_itf_nbfc_2017 = "true"
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
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "loc.")}
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

query "network_security_group_not_configured_gateway_subnets" {
  sql = <<-EOQ
    select
      subnet.id resource,
      case
        when subnet.name = 'GatewaySubnet' and network_security_group_id is not null then 'alarm'
        when subnet.name = 'GatewaySubnet' and network_security_group_id is null then 'ok'
        else 'skip'
      end as status,
      case
        when subnet.name = 'GatewaySubnet' and network_security_group_id is not null then 'Gateway subnet configured with network security group.'
        when subnet.name = 'GatewaySubnet' and network_security_group_id is null then 'Gateway subnet not configured with network security group.'
        else subnet.name || ' not of gateway subnet type.'
      end as reason
      ${replace(local.common_dimensions_global_qualifier_sql, "__QUALIFIER__", "subnet.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subnet as subnet
      join azure_subscription as sub on sub.subscription_id = subnet.subscription_id;
  EOQ
}

query "network_watcher_in_regions_with_virtual_network" {
  sql = <<-EOQ
    select
      a.id resource,
      case
        when b.region is null then 'alarm'
        when lower(b.resource_group) = 'networkwatcherrg' then 'ok'
        else 'alarm'
      end as status,
      case
        when b.region is null then 'Network watcher does not exist in region' || a.region || '.'
        when lower(b.resource_group) = 'networkwatcherrg' then b.name || ' exist in networkWatcherRG resource group.'
        else b.name || ' does not exist in networkWatcherRG resource group.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_virtual_network as a
      left join azure_network_watcher as b on a.region = b.region
      left join azure_subscription sub on sub.subscription_id = a.subscription_id;
  EOQ
}

query "network_security_group_diagnostic_setting_deployed" {
  sql = <<-EOQ
    with logging_details as (
      select
        distinct name as nsg_name
      from
        azure_network_security_group,
        jsonb_array_elements(diagnostic_settings) setting
      where
        diagnostic_settings is not null
        and setting ->> 'name' = 'setbypolicy'
    )
    select
      a.resource_guid as resource,
      case
        when a.diagnostic_settings is null then 'alarm'
        when l.nsg_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when a.diagnostic_settings is null then a.name || ' logging not enabled.'
        when l.nsg_name is null then a.name || ' logging not enabled.'
        else a.name || ' logging enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group as a
      left join logging_details as l on a.name = l.nsg_name,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "application_gateway_waf_enabled" {
  sql = <<-EOQ
    select
      ag.id resource,
      case
        when web_application_firewall_configuration is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when web_application_firewall_configuration is not null then ag.name || ' WAF enabled.'
        else ag.name || ' WAF disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "ag.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_application_gateway as ag
      join azure_subscription as sub on sub.subscription_id = ag.subscription_id;
  EOQ
}

query "network_ddos_enabled" {
  sql = <<-EOQ
    with application_gateway_subnet as (
      select
        distinct (split_part(c -> 'properties' -> 'subnet' ->> 'id', '/', 9)) as vn_name
      from
        azure_application_gateway as ag,
        jsonb_array_elements(gateway_ip_configurations) as c
    )
    select
      a.name as resource,
      case
        when b.vn_name is null then 'ok'
        when b.vn_name is not null and enable_ddos_protection::bool then 'ok'
        else 'alarm'
      end as status,
      case
        when b.vn_name is null then 'DDoS protection not required.'
        when b.vn_name is not null and enable_ddos_protection::bool then a.name || ' DDoS protection enabled.'
        else a.name || ' DDoS protection disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_virtual_network as a
      left join application_gateway_subnet as b on a.name = b.vn_name
      join azure_subscription sub on sub.subscription_id = a.subscription_id;
  EOQ
}

query "network_virtual_network_gateway_no_basic_sku" {
  sql = <<-EOQ
    select
      g.id as resource,
      case
        when g.sku_name = 'Basic' then 'alarm'
        else 'ok'
      end as status,
      case
        when g.sku_name = 'Basic' then g.title || ' using basic SKU.'
        else g.title || ' using ' || sku_name || ' SKU.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "g.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_virtual_network_gateway as g,
      azure_subscription as sub
    where
      sub.subscription_id = g.subscription_id;
  EOQ
}

query "network_lb_no_basic_sku" {
  sql = <<-EOQ
    select
      l.id as resource,
      case
        when l.sku_name = 'Basic' then 'alarm'
        else 'ok'
      end as status,
      case
        when l.sku_name = 'Basic' then l.title || ' using basic SKU.'
        else l.title || ' using ' || sku_name || ' SKU.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "l.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_lb as l,
      azure_subscription as sub
    where
      sub.subscription_id = l.subscription_id;
  EOQ
}

query "network_public_ip_no_basic_sku" {
  sql = <<-EOQ
    select
      i.id as resource,
      case
        when i.sku_name = 'Basic' then 'alarm'
        else 'ok'
      end as status,
      case
        when i.sku_name = 'Basic' then i.title || ' using basic SKU.'
        else i.title || ' using ' || sku_name || ' SKU.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_public_ip as i,
      azure_subscription as sub
    where
      sub.subscription_id = i.subscription_id;
  EOQ
}

query "network_bastion_host_min_1" {
  sql = <<-EOQ
    with bastion_hosts as (
      select
        subscription_id,
        _ctx,
        region,
        resource_group,
        count(*) as no_bastion_host
      from
        azure_bastion_host
      group by
        subscription_id,
        _ctx,
        resource_group,
        region
    )
    select
      sub.id as resource,
      case
        when i.subscription_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when i.subscription_id is null then sub.display_name || ' does not have bastion host.'
        else sub.display_name || ' has ' || no_bastion_host || ' bastion host(s).'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription as sub
      left join bastion_hosts as i on i.subscription_id = sub.subscription_id;
  EOQ
}

query "network_security_group_https_access_restricted" {
  sql = <<-EOQ
    with network_sg as (
      select distinct
        name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules) sg,
        jsonb_array_elements_text(sg -> 'properties' -> 'destinationPortRanges' || (sg -> 'properties' -> 'destinationPortRange') :: jsonb) dport,
        jsonb_array_elements_text(sg -> 'properties' -> 'sourceAddressPrefixes' || (sg -> 'properties' -> 'sourceAddressPrefix') :: jsonb) sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and sg -> 'properties' ->> 'protocol' ilike 'TCP'
        and sip in
        (
          '*',
          '0.0.0.0',
          '0.0.0.0/0',
          'Internet',
          'any',
          '<nw>/0',
          '/0'
        )
        and
        (
          dport in
          (
            '80',
            '*'
          )
          or
          (
            dport like '%-%'
            and split_part(dport, '-', 1) :: integer <= 80
            and split_part(dport, '-', 2) :: integer >= 80
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
        when nsg.sg_name is null then sg.title || ' restricts HTTPS access from internet.'
        else sg.title || ' allows HTTPS access from internet.'
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

query "network_security_group_ssh_access_restricted" {
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
          dport in ('22', '*')
          or (
            dport like '%-%'
            and split_part(dport, '-', 1) :: integer <= 22
            and split_part(dport, '-', 2) :: integer >= 22
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
          then sg.title || ' restricts SSH access from internet.'
        else sg.title || ' allows SSH access from internet.'
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

query "network_security_group_udp_service_restricted" {
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
        and sg -> 'properties' ->> 'protocol' = 'UDP'
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport = '*'
          or (
            dport like '%-%'
            and (
              53 between split_part(dport, '-', 1) :: integer and split_part(dport, '-', 2) :: integer
              or 123 between split_part(dport, '-', 1) :: integer and split_part(dport, '-', 2) :: integer
              or 161 between split_part(dport, '-', 1) :: integer and split_part(dport, '-', 2) :: integer
              or 389 between split_part(dport, '-', 1) :: integer and split_part(dport, '-', 2) :: integer
              or 1900 between split_part(dport, '-', 1) :: integer and split_part(dport, '-', 2) :: integer
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
        when nsg.sg_name is null
          then sg.title || ' restricts UDP services from internet.'
        else sg.title || ' allows UDP services from internet.'
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

query "network_sg_flowlog_retention_period_greater_than_90" {
  sql = <<-EOQ
    select
      sg.id resource,
      case
        when fl.id is null or not fl.enabled or fl.retention_policy_days < 90 then 'alarm'
        else 'ok'
      end as status,
      case
        when fl.id is null or not fl.enabled
          then sg.name || ' flowlog not enabled.'
        when fl.retention_policy_days < 90
          then sg.name || ' flowlog ' || fl.title || ' retention period is less than 90 days.'
        else sg.name || ' flowlog ' || fl.title || ' retention period is ' || fl.retention_policy_days || ' days.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group sg
      left join azure_network_watcher_flow_log fl on sg.id = fl.target_resource_id
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_network_peering_connected" {
  sql = <<-EOQ
    with disconnected_network_peering as (
      select
        distinct id as vn_id
      from
        azure_virtual_network as n,
        jsonb_array_elements(network_peerings) as p
      where
        p -> 'properties' ->> 'peeringState' = 'Disconnected'
    )
    select
      n.id as resource,
      case
        when jsonb_array_length(network_peerings) = 0 then 'ok'
        when p.vn_id is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when jsonb_array_length(network_peerings) = 0 then n.title || ' has no network peering.'
        when p.vn_id is not null then n.title || ' has network peering in disconnected state.'
        else n.title || ' has network peering in connected state.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "n.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_virtual_network as n
      left join disconnected_network_peering as p on p.vn_id = n.id
      join azure_subscription sub on sub.subscription_id = n.subscription_id;
  EOQ
}

query "network_security_group_restrict_inbound_udp_port_445" {
  sql = <<-EOQ
    with unrestricted_inbound as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules || default_security_rules ) sg,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'destinationPortRanges') > 0 then (sg -> 'properties' -> 'destinationPortRanges')
            else jsonb_build_array(sg -> 'properties' -> 'destinationPortRange')
          end ) as dport,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'sourceAddressPrefixes') > 0 then (sg -> 'properties' -> 'sourceAddressPrefixes')
            else jsonb_build_array(sg -> 'properties' -> 'sourceAddressPrefix')
          end ) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and (sg -> 'properties' ->> 'protocol' ilike 'UDP' or sg -> 'properties' ->> 'protocol' = '*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport in ('445', '*')
          or (
            dport like '%-%'
            and split_part(dport, '-', 1) :: integer <= 445
            and split_part(dport, '-', 2) :: integer >= 445
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
        when nsg.sg_name is null then sg.title || ' restricts UDP port 445 access from internet.'
        else sg.title || ' allows UDP port 445 access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group sg
      left join unrestricted_inbound nsg on nsg.sg_name = sg.name
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_security_group_restrict_inbound_tcp_port_20" {
  sql = <<-EOQ
    with unrestricted_inbound as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules || default_security_rules ) sg,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'destinationPortRanges') > 0 then (sg -> 'properties' -> 'destinationPortRanges')
            else jsonb_build_array(sg -> 'properties' -> 'destinationPortRange')
          end ) as dport,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'sourceAddressPrefixes') > 0 then (sg -> 'properties' -> 'sourceAddressPrefixes')
            else jsonb_build_array(sg -> 'properties' -> 'sourceAddressPrefix')
          end ) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and (sg -> 'properties' ->> 'protocol' ilike 'TCP' or sg -> 'properties' ->> 'protocol' = '*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport in ('20', '*')
          or (
            dport like '%-%'
            and split_part(dport, '-', 1) :: integer <= 20
            and split_part(dport, '-', 2) :: integer >= 20
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
        when nsg.sg_name is null then sg.title || ' restricts TCP port 20 access from internet.'
        else sg.title || ' allows TCP port 20 access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group sg
      left join unrestricted_inbound nsg on nsg.sg_name = sg.name
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_security_group_restrict_inbound_tcp_port_21" {
  sql = <<-EOQ
    with unrestricted_inbound as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules || default_security_rules ) sg,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'destinationPortRanges') > 0 then (sg -> 'properties' -> 'destinationPortRanges')
            else jsonb_build_array(sg -> 'properties' -> 'destinationPortRange')
          end ) as dport,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'sourceAddressPrefixes') > 0 then (sg -> 'properties' -> 'sourceAddressPrefixes')
            else jsonb_build_array(sg -> 'properties' -> 'sourceAddressPrefix')
          end ) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and (sg -> 'properties' ->> 'protocol' ilike 'TCP' or sg -> 'properties' ->> 'protocol' = '*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport in ('21', '*')
          or (
            dport like '%-%'
            and split_part(dport, '-', 1) :: integer <= 21
            and split_part(dport, '-', 2) :: integer >= 21
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
        when nsg.sg_name is null then sg.title || ' restricts TCP port 21 access from internet.'
        else sg.title || ' allows TCP port 21 access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group sg
      left join unrestricted_inbound nsg on nsg.sg_name = sg.name
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_security_group_restrict_inbound_icmp_port" {
  sql = <<-EOQ
    with unrestricted_inbound as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules || default_security_rules ) sg,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'destinationPortRanges') > 0 then (sg -> 'properties' -> 'destinationPortRanges')
            else jsonb_build_array(sg -> 'properties' -> 'destinationPortRange')
          end ) as dport,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'sourceAddressPrefixes') > 0 then (sg -> 'properties' -> 'sourceAddressPrefixes')
            else jsonb_build_array(sg -> 'properties' -> 'sourceAddressPrefix')
          end ) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and (sg -> 'properties' ->> 'protocol' ilike 'ICMP' or sg -> 'properties' ->> 'protocol' = '*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport = '*'
          or (
            dport like '%-%'
            and (
              split_part(dport, '-', 1) :: integer = 0
              and split_part(dport, '-', 2) :: integer = 65535
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
        when nsg.sg_name is null then sg.title || ' restricts ICMP access from internet.'
        else sg.title || ' allows ICMP access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group sg
      left join unrestricted_inbound nsg on nsg.sg_name = sg.name
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_security_group_restrict_inbound_tcp_port_4333" {
  sql = <<-EOQ
    with unrestricted_inbound as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules || default_security_rules ) sg,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'destinationPortRanges') > 0 then (sg -> 'properties' -> 'destinationPortRanges')
            else jsonb_build_array(sg -> 'properties' -> 'destinationPortRange')
          end ) as dport,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'sourceAddressPrefixes') > 0 then (sg -> 'properties' -> 'sourceAddressPrefixes')
            else jsonb_build_array(sg -> 'properties' -> 'sourceAddressPrefix')
          end ) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and (sg -> 'properties' ->> 'protocol' ilike 'TCP' or sg -> 'properties' ->> 'protocol' = '*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport in ('4333', '*')
          or (
            dport like '%-%'
            and (
              split_part(dport, '-', 1) :: integer = 4333
              and split_part(dport, '-', 2) :: integer = 4333
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
        when nsg.sg_name is null then sg.title || ' restricts TCP port 4333 access from internet.'
        else sg.title || ' allows TCP port 4333 access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group sg
      left join unrestricted_inbound nsg on nsg.sg_name = sg.name
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_security_group_restrict_inbound_tcp_port_3306" {
  sql = <<-EOQ
    with unrestricted_inbound as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules || default_security_rules ) sg,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'destinationPortRanges') > 0 then (sg -> 'properties' -> 'destinationPortRanges')
            else jsonb_build_array(sg -> 'properties' -> 'destinationPortRange')
          end ) as dport,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'sourceAddressPrefixes') > 0 then (sg -> 'properties' -> 'sourceAddressPrefixes')
            else jsonb_build_array(sg -> 'properties' -> 'sourceAddressPrefix')
          end ) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and (sg -> 'properties' ->> 'protocol' ilike 'TCP' or sg -> 'properties' ->> 'protocol' = '*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport in ('3306', '*')
          or (
            dport like '%-%'
            and (
              split_part(dport, '-', 1) :: integer = 3306
              and split_part(dport, '-', 2) :: integer = 3306
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
        when nsg.sg_name is null then sg.title || ' restricts TCP port 3306 access from internet.'
        else sg.title || ' allows TCP port 3306 access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group sg
      left join unrestricted_inbound nsg on nsg.sg_name = sg.name
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_security_group_restrict_inbound_tcp_port_53" {
  sql = <<-EOQ
    with unrestricted_inbound as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules || default_security_rules ) sg,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'destinationPortRanges') > 0 then (sg -> 'properties' -> 'destinationPortRanges')
            else jsonb_build_array(sg -> 'properties' -> 'destinationPortRange')
          end ) as dport,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'sourceAddressPrefixes') > 0 then (sg -> 'properties' -> 'sourceAddressPrefixes')
            else jsonb_build_array(sg -> 'properties' -> 'sourceAddressPrefix')
          end ) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and (sg -> 'properties' ->> 'protocol' ilike 'TCP' or sg -> 'properties' ->> 'protocol' = '*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport in ('53', '*')
          or (
            dport like '%-%'
            and (
              split_part(dport, '-', 1) :: integer = 53
              and split_part(dport, '-', 2) :: integer = 53
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
        when nsg.sg_name is null then sg.title || ' restricts TCP port 53 access from internet.'
        else sg.title || ' allows TCP port 53 access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group sg
      left join unrestricted_inbound nsg on nsg.sg_name = sg.name
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_security_group_restrict_inbound_udp_port_53" {
  sql = <<-EOQ
    with unrestricted_inbound as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules || default_security_rules ) sg,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'destinationPortRanges') > 0 then (sg -> 'properties' -> 'destinationPortRanges')
            else jsonb_build_array(sg -> 'properties' -> 'destinationPortRange')
          end ) as dport,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'sourceAddressPrefixes') > 0 then (sg -> 'properties' -> 'sourceAddressPrefixes')
            else jsonb_build_array(sg -> 'properties' -> 'sourceAddressPrefix')
          end ) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and (sg -> 'properties' ->> 'protocol' ilike 'UDP' or sg -> 'properties' ->> 'protocol' = '*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport in ('53', '*')
          or (
            dport like '%-%'
            and (
              split_part(dport, '-', 1) :: integer = 53
              and split_part(dport, '-', 2) :: integer = 53
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
        when nsg.sg_name is null then sg.title || ' restricts UDP port 53 access from internet.'
        else sg.title || ' allows UDP port 53 access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group sg
      left join unrestricted_inbound nsg on nsg.sg_name = sg.name
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_security_group_restrict_inbound_udp_port_137" {
  sql = <<-EOQ
    with unrestricted_inbound as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules || default_security_rules ) sg,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'destinationPortRanges') > 0 then (sg -> 'properties' -> 'destinationPortRanges')
            else jsonb_build_array(sg -> 'properties' -> 'destinationPortRange')
          end ) as dport,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'sourceAddressPrefixes') > 0 then (sg -> 'properties' -> 'sourceAddressPrefixes')
            else jsonb_build_array(sg -> 'properties' -> 'sourceAddressPrefix')
          end ) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and (sg -> 'properties' ->> 'protocol' ilike 'UDP' or sg -> 'properties' ->> 'protocol' = '*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport in ('137', '*')
          or (
            dport like '%-%'
            and (
              split_part(dport, '-', 1) :: integer = 137
              and split_part(dport, '-', 2) :: integer = 137
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
        when nsg.sg_name is null then sg.title || ' restricts UDP port 137 access from internet.'
        else sg.title || ' allows UDP port 137 access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group sg
      left join unrestricted_inbound nsg on nsg.sg_name = sg.name
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_security_group_restrict_inbound_udp_port_138" {
  sql = <<-EOQ
    with unrestricted_inbound as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules || default_security_rules ) sg,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'destinationPortRanges') > 0 then (sg -> 'properties' -> 'destinationPortRanges')
            else jsonb_build_array(sg -> 'properties' -> 'destinationPortRange')
          end ) as dport,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'sourceAddressPrefixes') > 0 then (sg -> 'properties' -> 'sourceAddressPrefixes')
            else jsonb_build_array(sg -> 'properties' -> 'sourceAddressPrefix')
          end ) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and (sg -> 'properties' ->> 'protocol' ilike 'UDP' or sg -> 'properties' ->> 'protocol' = '*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport in ('138', '*')
          or (
            dport like '%-%'
            and (
              split_part(dport, '-', 1) :: integer = 138
              and split_part(dport, '-', 2) :: integer = 138
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
        when nsg.sg_name is null then sg.title || ' restricts UDP port 138 access from internet.'
        else sg.title || ' allows UDP port 138 access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group sg
      left join unrestricted_inbound nsg on nsg.sg_name = sg.name
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_security_group_restrict_inbound_tcp_port_5432" {
  sql = <<-EOQ
    with unrestricted_inbound as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules || default_security_rules ) sg,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'destinationPortRanges') > 0 then (sg -> 'properties' -> 'destinationPortRanges')
            else jsonb_build_array(sg -> 'properties' -> 'destinationPortRange')
          end ) as dport,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'sourceAddressPrefixes') > 0 then (sg -> 'properties' -> 'sourceAddressPrefixes')
            else jsonb_build_array(sg -> 'properties' -> 'sourceAddressPrefix')
          end ) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and (sg -> 'properties' ->> 'protocol' ilike 'TCP' or sg -> 'properties' ->> 'protocol' = '*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport in ('5432', '*')
          or (
            dport like '%-%'
            and (
              split_part(dport, '-', 1) :: integer = 5432
              and split_part(dport, '-', 2) :: integer = 5432
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
        when nsg.sg_name is null then sg.title || ' restricts TCP port 5432 access from internet.'
        else sg.title || ' allows TCP port 5432 access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group sg
      left join unrestricted_inbound nsg on nsg.sg_name = sg.name
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_security_group_restrict_inbound_tcp_port_25" {
  sql = <<-EOQ
    with unrestricted_inbound as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules || default_security_rules ) sg,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'destinationPortRanges') > 0 then (sg -> 'properties' -> 'destinationPortRanges')
            else jsonb_build_array(sg -> 'properties' -> 'destinationPortRange')
          end ) as dport,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'sourceAddressPrefixes') > 0 then (sg -> 'properties' -> 'sourceAddressPrefixes')
            else jsonb_build_array(sg -> 'properties' -> 'sourceAddressPrefix')
          end ) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and (sg -> 'properties' ->> 'protocol' ilike 'TCP' or sg -> 'properties' ->> 'protocol' = '*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport in ('25', '*')
          or (
            dport like '%-%'
            and (
              split_part(dport, '-', 1) :: integer = 25
              and split_part(dport, '-', 2) :: integer = 25
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
        when nsg.sg_name is null then sg.title || ' restricts TCP port 25 access from internet.'
        else sg.title || ' allows TCP port 25 access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group sg
      left join unrestricted_inbound nsg on nsg.sg_name = sg.name
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_security_group_restrict_inbound_tcp_port_1433" {
  sql = <<-EOQ
    with unrestricted_inbound as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules || default_security_rules ) sg,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'destinationPortRanges') > 0 then (sg -> 'properties' -> 'destinationPortRanges')
            else jsonb_build_array(sg -> 'properties' -> 'destinationPortRange')
          end ) as dport,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'sourceAddressPrefixes') > 0 then (sg -> 'properties' -> 'sourceAddressPrefixes')
            else jsonb_build_array(sg -> 'properties' -> 'sourceAddressPrefix')
          end ) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and (sg -> 'properties' ->> 'protocol' ilike 'TCP' or sg -> 'properties' ->> 'protocol' = '*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport in ('1433', '*')
          or (
            dport like '%-%'
            and (
              split_part(dport, '-', 1) :: integer = 1433
              and split_part(dport, '-', 2) :: integer = 214335
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
        when nsg.sg_name is null then sg.title || ' restricts TCP port 1433 access from internet.'
        else sg.title || ' allows TCP port 1433 access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group sg
      left join unrestricted_inbound nsg on nsg.sg_name = sg.name
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_security_group_restrict_inbound_udp_port_1434" {
  sql = <<-EOQ
    with unrestricted_inbound as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules || default_security_rules ) sg,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'destinationPortRanges') > 0 then (sg -> 'properties' -> 'destinationPortRanges')
            else jsonb_build_array(sg -> 'properties' -> 'destinationPortRange')
          end ) as dport,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'sourceAddressPrefixes') > 0 then (sg -> 'properties' -> 'sourceAddressPrefixes')
            else jsonb_build_array(sg -> 'properties' -> 'sourceAddressPrefix')
          end ) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and (sg -> 'properties' ->> 'protocol' ilike 'UDP' or sg -> 'properties' ->> 'protocol' = '*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport in ('1434', '*')
          or (
            dport like '%-%'
            and (
              split_part(dport, '-', 1) :: integer = 1434
              and split_part(dport, '-', 2) :: integer = 1434
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
        when nsg.sg_name is null then sg.title || ' restricts UDP port 1434 access from internet.'
        else sg.title || ' allows UDP port 1434 access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group sg
      left join unrestricted_inbound nsg on nsg.sg_name = sg.name
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_security_group_restrict_inbound_tcp_port_23" {
  sql = <<-EOQ
    with unrestricted_inbound as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules || default_security_rules ) sg,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'destinationPortRanges') > 0 then (sg -> 'properties' -> 'destinationPortRanges')
            else jsonb_build_array(sg -> 'properties' -> 'destinationPortRange')
          end ) as dport,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'sourceAddressPrefixes') > 0 then (sg -> 'properties' -> 'sourceAddressPrefixes')
            else jsonb_build_array(sg -> 'properties' -> 'sourceAddressPrefix')
          end ) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and (sg -> 'properties' ->> 'protocol' ilike 'TCP' or sg -> 'properties' ->> 'protocol' = '*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport in ('23', '*')
          or (
            dport like '%-%'
            and (
              split_part(dport, '-', 1) :: integer = 23
              and split_part(dport, '-', 2) :: integer = 23
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
        when nsg.sg_name is null then sg.title || ' restricts TCP port 23 access from internet.'
        else sg.title || ' allows TCP port 23 access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group sg
      left join unrestricted_inbound nsg on nsg.sg_name = sg.name
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_security_group_restrict_inbound_tcp_port_5500" {
  sql = <<-EOQ
    with unrestricted_inbound as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules || default_security_rules ) sg,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'destinationPortRanges') > 0 then (sg -> 'properties' -> 'destinationPortRanges')
            else jsonb_build_array(sg -> 'properties' -> 'destinationPortRange')
          end ) as dport,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'sourceAddressPrefixes') > 0 then (sg -> 'properties' -> 'sourceAddressPrefixes')
            else jsonb_build_array(sg -> 'properties' -> 'sourceAddressPrefix')
          end ) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and (sg -> 'properties' ->> 'protocol' ilike 'TCP' or sg -> 'properties' ->> 'protocol' = '*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport in ('5500', '*')
          or (
            dport like '%-%'
            and (
              split_part(dport, '-', 1) :: integer = 5500
              and split_part(dport, '-', 2) :: integer = 5500
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
        when nsg.sg_name is null then sg.title || ' restricts TCP port 5500 access from internet.'
        else sg.title || ' allows TCP port 5500 access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group sg
      left join unrestricted_inbound nsg on nsg.sg_name = sg.name
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_security_group_restrict_inbound_tcp_port_5900" {
  sql = <<-EOQ
    with unrestricted_inbound as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules || default_security_rules ) sg,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'destinationPortRanges') > 0 then (sg -> 'properties' -> 'destinationPortRanges')
            else jsonb_build_array(sg -> 'properties' -> 'destinationPortRange')
          end ) as dport,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'sourceAddressPrefixes') > 0 then (sg -> 'properties' -> 'sourceAddressPrefixes')
            else jsonb_build_array(sg -> 'properties' -> 'sourceAddressPrefix')
          end ) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and (sg -> 'properties' ->> 'protocol' ilike 'TCP' or sg -> 'properties' ->> 'protocol' = '*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport in ('5900', '*')
          or (
            dport like '%-%'
            and (
              split_part(dport, '-', 1) :: integer = 5900
              and split_part(dport, '-', 2) :: integer = 5900
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
        when nsg.sg_name is null then sg.title || ' restricts TCP port 5900 access from internet.'
        else sg.title || ' allows TCP port 5900 access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group sg
      left join unrestricted_inbound nsg on nsg.sg_name = sg.name
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_security_group_restrict_inbound_tcp_port_135" {
  sql = <<-EOQ
    with unrestricted_inbound as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules || default_security_rules ) sg,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'destinationPortRanges') > 0 then (sg -> 'properties' -> 'destinationPortRanges')
            else jsonb_build_array(sg -> 'properties' -> 'destinationPortRange')
          end ) as dport,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'sourceAddressPrefixes') > 0 then (sg -> 'properties' -> 'sourceAddressPrefixes')
            else jsonb_build_array(sg -> 'properties' -> 'sourceAddressPrefix')
          end ) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and (sg -> 'properties' ->> 'protocol' ilike 'TCP' or sg -> 'properties' ->> 'protocol' = '*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport in ('135', '*')
          or (
            dport like '%-%'
            and (
              split_part(dport, '-', 1) :: integer = 135
              and split_part(dport, '-', 2) :: integer = 135
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
        when nsg.sg_name is null then sg.title || ' restricts TCP port 135 access from internet.'
        else sg.title || ' allows TCP port 135 access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group sg
      left join unrestricted_inbound nsg on nsg.sg_name = sg.name
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_security_group_restrict_inbound_tcp_port_445" {
  sql = <<-EOQ
    with unrestricted_inbound as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules || default_security_rules ) sg,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'destinationPortRanges') > 0 then (sg -> 'properties' -> 'destinationPortRanges')
            else jsonb_build_array(sg -> 'properties' -> 'destinationPortRange')
          end ) as dport,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'sourceAddressPrefixes') > 0 then (sg -> 'properties' -> 'sourceAddressPrefixes')
            else jsonb_build_array(sg -> 'properties' -> 'sourceAddressPrefix')
          end ) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and (sg -> 'properties' ->> 'protocol' ilike 'TCP' or sg -> 'properties' ->> 'protocol' = '*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and (
          dport in ('445', '*')
          or (
            dport like '%-%'
            and (
              split_part(dport, '-', 1) :: integer = 445
              and split_part(dport, '-', 2) :: integer = 445
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
        when nsg.sg_name is null then sg.title || ' restricts TCP port 445 access from internet.'
        else sg.title || ' allows TCP port 445 access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group sg
      left join unrestricted_inbound nsg on nsg.sg_name = sg.name
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_security_group_outbound_access_restricted" {
  sql = <<-EOQ
    with unrestricted_outbound as (
      select
        distinct name sg_name
      from
        azure_network_security_group nsg,
        jsonb_array_elements(security_rules || default_security_rules ) sg,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'destinationPortRanges') > 0 then (sg -> 'properties' -> 'destinationPortRanges')
            else jsonb_build_array(sg -> 'properties' -> 'destinationPortRange')
          end ) as dport,
        jsonb_array_elements_text(
          case
            when jsonb_array_length(sg -> 'properties' -> 'sourceAddressPrefixes') > 0 then (sg -> 'properties' -> 'sourceAddressPrefixes')
            else jsonb_build_array(sg -> 'properties' -> 'sourceAddressPrefix')
          end ) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Outbound'
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
        and dport = '*'
    )
    select
      sg.id resource,
      case
        when nsg.sg_name is null then 'ok'
        else 'alarm'
      end as status,
      case
        when nsg.sg_name is null then sg.title || ' restricts outbound access from internet.'
        else sg.title || ' allows outbound access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group sg
      left join unrestricted_outbound nsg on nsg.sg_name = sg.name
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_sg_flowlog_enabled" {
  sql = <<-EOQ
    select
      sg.id resource,
      case
        when sg.flow_logs is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when sg.flow_logs is not null then sg.name || ' flowlog enabled.'
        else sg.name || ' flowlog disabled.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_security_group as sg
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}

query "network_lb_diagnostics_logs_enabled" {
  sql = <<-EOQ
    select
      l.id as resource,
      case
        when jsonb_array_length(diagnostic_settings) > 0  then 'ok'
        else 'alarm'
      end as status,
      case
        when jsonb_array_length(diagnostic_settings) > 0 then l.title || ' diagnostics logs enabled.'
        else l.title || 'diagnostics logs disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "l.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_lb as l,
      azure_subscription as sub
    where
      sub.subscription_id = l.subscription_id;
  EOQ
}

query "network_watcher_flow_log_enabled" {
  sql = <<-EOQ
    select
      sg.id resource,
      case
        when sg.enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when sg.enabled then sg.name || ' flowlog enabled.'
        else sg.name || ' flowlog disabled.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_network_watcher_flow_log as sg
      join azure_subscription sub on sub.subscription_id = sg.subscription_id;
  EOQ
}