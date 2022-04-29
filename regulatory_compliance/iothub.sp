locals {
  regulatory_compliance_iothub_common_tags = {
    service = "Azure/IoTHub"
  }
}

control "iot_hub_logging_enabled" {
  title       = "Resource logs in IoT Hub should be enabled"
  description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised."
  sql         = query.iot_hub_logging_enabled.sql

  tags = merge(local.regulatory_compliance_iothub_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}