locals {
  cis_v400_8_common_tags = merge(local.cis_v400_common_tags, {
    cis_section_id = "8"
  })
}

benchmark "cis_v400_8" {
  title         = "8 Networking Services"
  documentation = file("./cis_v400/docs/cis_v400_8.md")
  children = [
    control.cis_v400_8_1,
    control.cis_v400_8_2,
    control.cis_v400_8_3,
    control.cis_v400_8_4,
    control.cis_v400_8_5,
    control.cis_v400_8_6,
    control.cis_v400_8_7,
    control.cis_v400_8_8
  ]

  tags = merge(local.cis_v400_8_common_tags, {
    type    = "Benchmark"
    service = "Azure/VPC"
  })
}

control "cis_v400_8_1" {
  title         = "8.1 Ensure that RDP access from the Internet is evaluated and restricted"
  description   = "Network security groups should be periodically evaluated for port misconfigurations."
  query         = query.network_security_group_rdp_access_restricted
  documentation = file("./cis_v400/docs/cis_v400_8_1.md")

  tags = merge(local.cis_v400_8_common_tags, {
    cis_item_id = "8.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/VPC"
  })
}

control "cis_v400_8_2" {
  title         = "8.2 Ensure that SSH access from the Internet is evaluated and restricted"
  description   = "Network security groups should be periodically evaluated for port misconfigurations."
  query         = query.network_security_group_ssh_access_restricted
  documentation = file("./cis_v400/docs/cis_v400_8_2.md")

  tags = merge(local.cis_v400_8_common_tags, {
    cis_item_id = "8.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/VPC"
  })
}

control "cis_v400_8_3" {
  title         = "8.3 Ensure that UDP access from the Internet is evaluated and restricted"
  description   = "Network security groups should be periodically evaluated for port misconfigurations."
  query         = query.network_security_group_udp_service_restricted
  documentation = file("./cis_v400/docs/cis_v400_8_3.md")

  tags = merge(local.cis_v400_8_common_tags, {
    cis_item_id = "8.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/VPC"
  })
}

control "cis_v400_8_4" {
  title         = "8.4 Ensure that HTTP(S) access from the Internet is evaluated and restricted"
  description   = "Network security groups should be periodically evaluated for port misconfigurations."
  query         = query.network_security_group_https_access_restricted
  documentation = file("./cis_v400/docs/cis_v400_8_4.md")

  tags = merge(local.cis_v400_8_common_tags, {
    cis_item_id = "8.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/VPC"
  })
}

control "cis_v400_8_5" {
  title         = "8.5 Ensure that Network Security Group Flow Log retention period is 'greater than 90 days'"
  description   = "Network Security Group Flow Logs should be enabled and the retention period set to greater than or equal to 90 days."
  query         = query.network_sg_flowlog_retention_period_greater_than_90
  documentation = file("./cis_v400/docs/cis_v400_8_5.md")

  tags = merge(local.cis_v400_8_common_tags, {
    cis_item_id = "8.5"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/VPC"
  })
}

control "cis_v400_8_6" {
  title         = "8.6 Ensure that Network Watcher is 'Enabled' for Azure Regions that are in use"
  description   = "Enable Network Watcher for physical regions in Azure subscriptions."
  query         = query.network_watcher_enabled
  documentation = file("./cis_v400/docs/cis_v400_8_6.md")

  tags = merge(local.cis_v400_8_common_tags, {
    cis_item_id = "8.6"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/VPC"
  })
}

control "cis_v400_8_7" {
  title         = "8.7 Ensure that Public IP addresses are Evaluated on a Periodic Basis"
  description   = "Public IP Addresses provide tenant accounts with Internet connectivity for resources contained within the tenant."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_8_7.md")

  tags = merge(local.cis_v400_8_common_tags, {
    cis_item_id = "8.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/VPC"
  })
}

control "cis_v400_8_8" {
  title         = "8.8 Ensure that virtual network flow log retention days is set to greater than or equal to 90"
  description   = "Ensure that virtual network flow logs are retained for greater than or equal to 90 days."
  query         = query.network_watcher_flow_log_retention_90_days
  documentation = file("./cis_v400/docs/cis_v400_8_8.md")

  tags = merge(local.cis_v400_8_common_tags, {
    cis_item_id = "8.8"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/VPC"
  })
}
