locals {
  cis_v200_6_common_tags = merge(local.cis_v200_common_tags, {
    cis_section_id = "6"
  })
}

benchmark "cis_v200_6" {
  title         = "6 Networking"
  documentation = file("./cis_v200/docs/cis_v200_6.md")
  children = [
    control.cis_v200_6_1,
    control.cis_v200_6_2,
    control.cis_v200_6_3,
    control.cis_v200_6_4,
    control.cis_v200_6_5,
    control.cis_v200_6_6,
    control.cis_v200_6_7
  ]

  tags = merge(local.cis_v200_6_common_tags, {
    type    = "Benchmark"
    service = "Azure/Network"
  })
}

control "cis_v200_6_1" {
  title         = "6.1 Ensure that RDP access from the Internet is evaluated and restricted"
  description   = "Network security groups should be periodically evaluated for port misconfigurations. Where certain ports and protocols may be exposed to the Internet, they should be evaluated for necessity and restricted wherever they are not explicitly required."
  query         = query.network_security_group_rdp_access_restricted
  documentation = file("./cis_v200/docs/cis_v200_6_1.md")

  tags = merge(local.cis_v200_6_common_tags, {
    cis_item_id = "6.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v200_6_2" {
  title         = "6.2 Ensure that SSH access from the Internet is evaluated and restricted"
  description   = "Network security groups should be periodically evaluated for port misconfigurations. Where certain ports and protocols may be exposed to the Internet, they should be evaluated for necessity and restricted wherever they are not explicitly required."
  query         = query.network_security_group_ssh_access_restricted
  documentation = file("./cis_v200/docs/cis_v200_6_2.md")

  tags = merge(local.cis_v200_6_common_tags, {
    cis_item_id = "6.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v200_6_3" {
  title         = "6.3 Ensure that UDP access from the Internet is evaluated and restricted"
  description   = "Network security groups should be periodically evaluated for port misconfigurations. Where certain ports and protocols may be exposed to the Internet, they should be evaluated for necessity and restricted wherever they are not explicitly required."
  query         = query.network_security_group_udp_service_restricted
  documentation = file("./cis_v200/docs/cis_v200_6_3.md")

  tags = merge(local.cis_v200_6_common_tags, {
    cis_item_id = "6.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v200_6_4" {
  title         = "6.4 Ensure that HTTP(S) access from the Internet is evaluated and restricted"
  description   = "Network security groups should be periodically evaluated for port misconfigurations. Where certain ports and protocols may be exposed to the Internet, they should be evaluated for necessity and restricted wherever they are not explicitly required and narrowly configured."
  query         = query.network_security_group_https_access_restricted
  documentation = file("./cis_v200/docs/cis_v200_6_4.md")

  tags = merge(local.cis_v200_6_common_tags, {
    cis_item_id = "6.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v200_6_5" {
  title         = "6.5 Ensure that Network Security Group Flow Log retention period is 'greater than 90 days'"
  description   = "Network Security Group Flow Logs should be enabled and the retention period set to greater than or equal to 90 days."
  query         = query.network_sg_flowlog_retention_period_greater_than_90
  documentation = file("./cis_v200/docs/cis_v200_6_5.md")

  tags = merge(local.cis_v200_6_common_tags, {
    cis_item_id = "6.5"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v200_6_6" {
  title         = "6.6 Ensure that Network Watcher is 'Enabled'"
  description   = "Enable Network Watcher for Azure subscriptions."
  query         = query.network_watcher_enabled
  documentation = file("./cis_v200/docs/cis_v200_6_6.md")

  tags = merge(local.cis_v200_6_common_tags, {
    cis_item_id = "6.6"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v200_6_7" {
  title         = "6.7 Ensure that Public IP addresses are Evaluated on a Periodic Basis"
  description   = "Public IP Addresses provide tenant accounts with Internet connectivity for resources contained within the tenant. During the creation of certain resources in Azure, a Public IP Address may be created. All Public IP Addresses within the tenant should be periodically reviewed for accuracy and necessity."
  # query         = query.network_watcher_enabled
  documentation = file("./cis_v200/docs/cis_v200_6_7.md")

  tags = merge(local.cis_v200_6_common_tags, {
    cis_item_id = "6.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/Network"
  })
}
