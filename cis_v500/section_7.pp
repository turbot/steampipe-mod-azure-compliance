locals {
  cis_v500_7_common_tags = merge(local.cis_v500_common_tags, {
    cis_section_id = "7"
  })
}

benchmark "cis_v500_7" {
  title         = "7 Networking Services"
  documentation = file("./cis_v500/docs/cis_v500_7.md")
  children = [
    control.cis_v500_7_1,
    control.cis_v500_7_2,
    control.cis_v500_7_3,
    control.cis_v500_7_4,
    control.cis_v500_7_5,
    control.cis_v500_7_6,
    control.cis_v500_7_7,
    control.cis_v500_7_8,
    control.cis_v500_7_9,
    control.cis_v500_7_10,
    control.cis_v500_7_11,
    control.cis_v500_7_12,
    control.cis_v500_7_13,
    control.cis_v500_7_14,
    control.cis_v500_7_15,
    control.cis_v500_7_16
  ]

  tags = merge(local.cis_v500_7_common_tags, {
    type    = "Benchmark"
    service = "Azure/Network"
  })
}

control "cis_v500_7_1" {
  title         = "7.1 Ensure that RDP access from the Internet is evaluated and restricted"
  description   = "Network security groups should be periodically evaluated for port misconfigurations. Where RDP is not explicitly required and narrowly configured for resources attached to a network security group, Internet-level access to Azure resources should be restricted or eliminated."
  query         = query.network_security_group_rdp_access_restricted
  documentation = file("./cis_v500/docs/cis_v500_7_1.md")

  tags = merge(local.cis_v500_7_common_tags, {
    cis_item_id = "7.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v500_7_2" {
  title         = "7.2 Ensure that SSH access from the Internet is evaluated and restricted"
  description   = "Network security groups should be periodically evaluated for port misconfigurations. Where SSH is not explicitly required and narrowly configured for resources attached to a network security group, Internet-level access to Azure resources should be restricted or eliminated."
  query         = query.network_security_group_ssh_access_restricted
  documentation = file("./cis_v500/docs/cis_v500_7_2.md")

  tags = merge(local.cis_v500_7_common_tags, {
    cis_item_id = "7.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v500_7_3" {
  title         = "7.3 Ensure that UDP access from the Internet is evaluated and restricted"
  description   = "Network security groups should be periodically evaluated for port misconfigurations. Where UDP is not explicitly required and narrowly configured for resources attached to a network security group, Internet-level access to Azure resources should be restricted or eliminated."
  query         = query.network_security_group_udp_service_restricted
  documentation = file("./cis_v500/docs/cis_v500_7_3.md")

  tags = merge(local.cis_v500_7_common_tags, {
    cis_item_id = "7.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v500_7_4" {
  title         = "7.4 Ensure that HTTP(S) access from the Internet is evaluated and restricted"
  description   = "Network security groups should be periodically evaluated for port misconfigurations. Where HTTP(S) is not explicitly required and narrowly configured for resources attached to a network security group, Internet-level access to Azure resources should be restricted or eliminated."
  query         = query.network_security_group_https_port_80_443_access_restricted
  documentation = file("./cis_v500/docs/cis_v500_7_4.md")

  tags = merge(local.cis_v500_7_common_tags, {
    cis_item_id = "7.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v500_7_5" {
  title         = "7.5 Ensure that network security group flow log retention days is set to greater than or equal to 90"
  description   = "Network security group flow logs should be enabled and the retention period set to greater than or equal to 90 days."
  query         = query.network_sg_flowlog_retention_period_greater_than_90
  documentation = file("./cis_v500/docs/cis_v500_7_5.md")

  tags = merge(local.cis_v500_7_common_tags, {
    cis_item_id = "7.5"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v500_7_6" {
  title         = "7.6 Ensure that Network Watcher is 'Enabled' for Azure Regions that are in use"
  description   = "Enable Network Watcher for physical regions in Azure subscriptions."
  query         = query.network_watcher_enabled
  documentation = file("./cis_v500/docs/cis_v500_7_6.md")

  tags = merge(local.cis_v500_7_common_tags, {
    cis_item_id = "7.6"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v500_7_7" {
  title         = "7.7 Ensure that Public IP addresses are Evaluated on a Periodic Basis"
  description   = "Public IP Addresses provide tenant accounts with Internet connectivity for resources contained within the tenant. During the creation of certain resources in Azure, a Public IP Address may be created. All Public IP Addresses within the tenant should be periodically reviewed for accuracy and necessity."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_7_7.md")

  tags = merge(local.cis_v500_7_common_tags, {
    cis_item_id = "7.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/Network"
  })
}

control "cis_v500_7_8" {
  title         = "7.8 Ensure that virtual network flow log retention days is set to greater than or equal to 90"
  description   = "Ensure that virtual network flow logs are retained for greater than or equal to 90 days."
  query         = query.network_virtual_network_watcher_flow_log_retention_90_days
  documentation = file("./cis_v500/docs/cis_v500_7_8.md")

  tags = merge(local.cis_v500_7_common_tags, {
    cis_item_id = "7.8"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v500_7_9" {
  title         = "7.9 Ensure 'Authentication type' is set to 'Azure Active Directory' only for Azure VPN Gateway point-to-site configuration"
  description   = "VPN Gateway point-to-site connections should use Azure Active Directory authentication for enhanced security and centralized identity management."
  query         = query.network_virtual_network_gateway_aad_only
  documentation = file("./cis_v500/docs/cis_v500_7_9.md")

  tags = merge(local.cis_v500_7_common_tags, {
    cis_item_id = "7.9"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Network"
  })
}

control "cis_v500_7_10" {
  title         = "7.10 Ensure Azure Web Application Firewall (WAF) is enabled on Azure Application Gateway"
  description   = "Deploy Azure Web Application Firewall (WAF) in front of public facing web applications for additional inspection of incoming traffic."
  query         = query.application_gateway_waf_enabled
  documentation = file("./cis_v500/docs/cis_v500_7_10.md")

  tags = merge(local.cis_v500_7_common_tags, {
    cis_item_id = "7.10"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v500_7_11" {
  title         = "7.11 Ensure subnets are associated with network security groups"
  description   = "Subnets should be associated with network security groups to control network traffic flow and enhance network security."
  query         = query.network_security_group_subnet_associated
  documentation = file("./cis_v500/docs/cis_v500_7_11.md")

  tags = merge(local.cis_v500_7_common_tags, {
    cis_item_id = "7.11"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v500_7_12" {
  title         = "7.12 Ensure the SSL policy's 'Min protocol version' is set to 'TLSv1_2' or higher on Azure Application Gateway"
  description   = "The TLS protocol secures transmission of data between servers and clients by encrypting the data stream. Vulnerabilities in older versions of TLS can lead to potential security risks. Setting the minimum TLS version to TLSv1_2 or higher ensures that only secure versions of the protocol are used."
  query         = query.application_gateway_min_tls_1_2
  documentation = file("./cis_v500/docs/cis_v500_7_12.md")

  tags = merge(local.cis_v500_7_common_tags, {
    cis_item_id = "7.12"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v500_7_13" {
  title         = "7.13 Ensure 'HTTP2' is set to 'Enabled' on Azure Application Gateway"
  description   = "HTTP/2 is a major revision of the HTTP network protocol and offers significant performance improvements over HTTP/1.1. Enabling HTTP/2 on Application Gateway can improve application performance and reduce latency."
  query         = query.application_gateway_http2_enabled
  documentation = file("./cis_v500/docs/cis_v500_7_13.md")

  tags = merge(local.cis_v500_7_common_tags, {
    cis_item_id = "7.13"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v500_7_14" {
  title         = "7.14 Ensure request body inspection is enabled in Azure Web Application Firewall policy on Azure Application Gateway"
  description   = "Request body inspection allows WAF to inspect the body of HTTP requests for potential threats. Enabling this feature enhances security by detecting attacks that may be hidden in request payloads."
  query         = query.web_application_firewall_policy_request_body_inspection_enabled
  documentation = file("./cis_v500/docs/cis_v500_7_14.md")

  tags = merge(local.cis_v500_7_common_tags, {
    cis_item_id = "7.14"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v500_7_15" {
  title         = "7.15 Ensure bot protection is enabled in Azure Web Application Firewall policy on Azure Application Gateway"
  description   = "Bot protection helps protect web applications from malicious bots that can scrape content, perform credential stuffing, or launch DDoS attacks. Enabling bot protection enhances application security."
  query         = query.web_application_firewall_policy_bot_protection_enabled
  documentation = file("./cis_v500/docs/cis_v500_7_15.md")

  tags = merge(local.cis_v500_7_common_tags, {
    cis_item_id = "7.15"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v500_7_16" {
  title         = "7.16 Ensure Azure Network Security Perimeter is used to secure Azure platform-as-a-service resources"
  description   = "Azure Network Security Perimeter provides a way to define and enforce network security boundaries around Azure PaaS resources, helping to prevent data exfiltration and unauthorized access."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_7_16.md")

  tags = merge(local.cis_v500_7_common_tags, {
    cis_item_id = "7.16"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Network"
  })
}
