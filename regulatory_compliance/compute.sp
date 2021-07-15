locals {
  conformance_pack_compute_common_tags = {
    service = "compute"
  }
}

control "compute_os_and_data_disk_encrypted_with_cmk" {
  title       = "Disk encryption should be applied on virtual machines"
  description   = "Virtual machines without an enabled disk encryption will be monitored by Azure Security Center as recommendations."
  sql         = query.compute_os_and_data_disk_encrypted_with_cmk.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_unattached_disk_encrypted_with_cmk" {
  title       = "Unattached disks should be encrypted"
  description   = "This policy audits any unattached disk without encryption enabled."
  sql         = query.compute_unattached_disk_encrypted_with_cmk.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}