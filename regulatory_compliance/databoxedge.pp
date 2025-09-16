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
    fedramp_high          = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "databox_job_double_encryption_enabled" {
  title       = "Azure Data Box jobs should enable double encryption for data at rest on the device"
  description = "Enable a second layer of software-based encryption for data at rest on the device. The device is already protected via Advanced Encryption Standard 256-bit encryption for data at rest. This option adds a second layer of data encryption."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_databoxedge_common_tags, {
    nist_sp_800_53_rev_5  = "true"
  })
}

control "databox_job_unlock_password_encrypted_with_cmk" {
  title       = "Azure Data Box jobs should use a customer-managed key to encrypt the device unlock password"
  description = "Use a customer-managed key to control the encryption of the device unlock password for Azure Data Box. Customer-managed keys also help manage access to the device unlock password by the Data Box service in order to prepare the device and copy data in an automated manner. The data on the device itself is already encrypted at rest with Advanced Encryption Standard 256-bit encryption, and the device unlock password is encrypted by default with a Microsoft managed key."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_databoxedge_common_tags, {
    nist_sp_800_53_rev_5  = "true"
  })
}

query "databox_edge_device_double_encryption_enabled" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when sku_name = any (ARRAY ['TEA_1Node', 'TEA_1Node_UPS', 'TEA_1Node_Heater', 'TEA_1Node_UPS_Heater', 'TEA_4Node_Heater', 'TEA_4Node_UPS_Heater', 'TMA', 'EdgePR_Base', 'EdgePR_Base_UPS', 'EdgeMR_Mini']) then 'ok'
        else 'alarm'
      end as status,
      case
        when sku_name = any (ARRAY ['TEA_1Node', 'TEA_1Node_UPS', 'TEA_1Node_Heater', 'TEA_1Node_UPS_Heater', 'TEA_4Node_Heater', 'TEA_4Node_UPS_Heater', 'TMA', 'EdgePR_Base', 'EdgePR_Base_UPS', 'EdgeMR_Mini']) then a.name || ' double encryption enabled.'
        else a.name || ' double encryption disabled.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_databox_edge_device as a
      left join azure_subscription as sub on sub.subscription_id = a.subscription_id;
  EOQ
}
