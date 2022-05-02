locals {
  cis_v130_6_common_tags = merge(local.cis_v130_common_tags, {
    cis_section_id = "6"
  })
}

benchmark "cis_v130_6" {
  title         = "6 Networking"
  documentation = file("./cis_v130/docs/cis_v130_6.md")
  children = [
    control.cis_v130_6_1,
    control.cis_v130_6_2,
    control.cis_v130_6_3,
    control.cis_v130_6_4,
    control.cis_v130_6_5,
    control.cis_v130_6_6
  ]

  tags = merge(local.cis_v130_6_common_tags, {
    type    = "Benchmark"
    service = "Azure/Network"
  })
}

control "cis_v130_6_1" {
  title         = "6.1 Ensure that RDP access is restricted from the internet"
  description   = "Disable RDP access on network security groups from the Internet."
  sql           = query.network_security_group_rdp_access_restricted.sql
  documentation = file("./cis_v130/docs/cis_v130_6_1.md")

  tags = merge(local.cis_v130_6_common_tags, {
    cis_item_id = "6.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v130_6_2" {
  title         = "6.2 Ensure that SSH access is restricted from the internet"
  description   = "Disable SSH access on network security groups from the Internet."
  sql           = query.network_security_group_ssh_access_restricted.sql
  documentation = file("./cis_v130/docs/cis_v130_6_2.md")

  tags = merge(local.cis_v130_6_common_tags, {
    cis_item_id = "6.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v130_6_3" {
  title         = "6.3 Ensure no SQL Databases allow ingress 0.0.0.0/0 (ANY IP)"
  description   = "Ensure that no SQL Databases allow ingress from 0.0.0.0/0 (ANY IP)."
  sql           = query.sql_database_allow_internet_access.sql
  documentation = file("./cis_v130/docs/cis_v130_6_3.md")

  tags = merge(local.cis_v130_6_common_tags, {
    cis_item_id = "6.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v130_6_4" {
  title         = "6.4 Ensure that Network Security Group Flow Log retention period is 'greater than 90 days'"
  description   = "Network Security Group Flow Logs should be enabled and the retention period is set to greater than or equal to 90 days."
  sql           = query.network_sg_flowlog_retention_period_greater_than_90.sql
  documentation = file("./cis_v130/docs/cis_v130_6_4.md")

  tags = merge(local.cis_v130_6_common_tags, {
    cis_item_id = "6.4"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v130_6_5" {
  title         = "6.5 Ensure that Network Watcher is 'Enabled'"
  description   = "Enable Network Watcher for Azure subscriptions."
  sql           = query.network_watcher_enabled.sql
  documentation = file("./cis_v130/docs/cis_v130_6_5.md")

  tags = merge(local.cis_v130_6_common_tags, {
    cis_item_id = "6.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/Network"
  })
}

control "cis_v130_6_6" {
  title         = "6.6 Ensure that UDP Services are restricted from the Internet"
  description   = "Disable Internet exposed UDP ports on network security groups."
  sql           = query.network_security_group_udp_service_restricted.sql
  documentation = file("./cis_v130/docs/cis_v130_6_6.md")

  tags = merge(local.cis_v130_6_common_tags, {
    cis_item_id = "6.6"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}
