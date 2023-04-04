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
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_databox_edge_device as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}
