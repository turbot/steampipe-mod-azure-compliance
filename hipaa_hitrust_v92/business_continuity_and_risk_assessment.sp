benchmark "hipaa_hitrust_v92_business_continuity_and_risk_assessment" {
  title         = "Business Continuity and Risk Assessment"
  children = [
    benchmark.hipaa_hitrust_v92_1635_12b1organizational_2_12_b
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1635_12b1organizational_2_12_b" {
  title         = "1635.12b1Organizational.2 - 12.b"
  description   = "Information security aspects of business continuity are (i) based on identifying events (or sequence of events) that can cause interruptions to the organization's critical business processes (e.g., equipment failure, human errors, theft, fire, natural disasters acts of terrorism); (ii) followed by a risk assessment to determine the probability and impact of such interruptions, in terms of time, damage scale and recovery period; (iii) based on the results of the risk assessment, a business continuity strategy is developed to identify the overall approach to business continuity; and (iv) once this strategy has been created, endorsement is provided by management, and a plan created and endorsed to implement this strategy."
  children = [
    control.hipaa_hitrust_v92_1635_12b1organizational_2_12_b_2,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_1635_12b1organizational_2_12_b_2" {
  title         = "Key vaults should have purge protection enabled"
  description   = "AMalicious deletion of a key vault can lead to permanent data loss. A malicious insider in your organization can potentially delete and purge key vaults. Purge protection protects you from insider attacks by enforcing a mandatory retention period for soft deleted key vaults. No one inside your organization or Microsoft will be able to purge your key vaults during the soft delete retention period."
  sql           = query.keyvault_purge_protection_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}