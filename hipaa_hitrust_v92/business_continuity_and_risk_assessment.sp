benchmark "hipaa_hitrust_v92_business_continuity_and_risk_assessment" {
  title    = "Business Continuity and Risk Assessment"
  children = [
    benchmark.hipaa_hitrust_v92_1634_12b1organizational_1_12_b,
    benchmark.hipaa_hitrust_v92_1635_12b1organizational_2_12_b,
    benchmark.hipaa_hitrust_v92_1638_12b2organizational_345_12_b
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1635_12b1organizational_2_12_b" {
  title       = "Information security aspects of business continuity"
  description = "Information security aspects of business continuity are (i) based on identifying events (or sequence of events) that can cause interruptions to the organization's critical business processes (e.g., equipment failure, human errors, theft, fire, natural disasters acts of terrorism); (ii) followed by a risk assessment to determine the probability and impact of such interruptions, in terms of time, damage scale and recovery period; (iii) based on the results of the risk assessment, a business continuity strategy is developed to identify the overall approach to business continuity; and (iv) once this strategy has been created, endorsement is provided by management, and a plan created and endorsed to implement this strategy."
  children = [
    control.keyvault_managed_hms_purge_protection_enabled,
    control.keyvault_purge_protection_enabled,
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/KeyVault"
  })
}

benchmark "hipaa_hitrust_v92_1634_12b1organizational_1_12_b" {
  title    = "The organization identifies the critical business processes requiring business continuity"
  children = [
    control.compute_vm_disaster_recovery_enabled
  ]

   tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_1638_12b2organizational_345_12_b" {
  title       = "Business continuity risk assessments"
  description = "Business continuity risk assessments (i) are carried out annually with full involvement from owners of business resources and processes; (ii) consider all business processes and is not limited to the information assets, but includes the results specific to information security; and (iii) identifies, quantifies, and prioritizes risks against key business objectives and criteria relevant to the organization, including critical resources, impacts of disruptions, allowable outage times, and recovery priorities."
  children = [
    control.compute_vm_disaster_recovery_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/Compute"
  })
}