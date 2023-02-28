locals {
  regulatory_compliance_databoxedge_common_tags = {
    service = "Azure/DataBox"
  }
}

control "databox_edge_device_double_encryption_enabled" {
  title       = "Azure Stack Edge devices should use double-encryption"
  description = "To secure the data at rest on the device, ensure it's double-encrypted, the access to data is controlled, and once the device is deactivated, the data is securely erased off the data disks. Double encryption is the use of two layers of encryption: BitLocker XTS-AES 256-bit encryption on the data volumes and built-in encryption of the hard drives. Learn more in the security overview documentation for the specific Stack Edge device."
  query       = query.databox_edge_device_double_encryption_enabled

  tags = merge(local.regulatory_compliance_databoxedge_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}
