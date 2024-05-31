benchmark "rbi_itf_nbfc_v2017_it_policy" {
  title = "IT Policy"
  children = [
    benchmark.rbi_itf_nbfc_v2017_it_policy_2
  ]

  tags = local.rbi_itf_nbfc_v2017_common_tags
}

benchmark "rbi_itf_nbfc_v2017_it_policy_2" {
  title = "IT Policy-2"
  children = [
    control.compute_vm_adaptive_application_controls_enabled,
    control.securitycenter_notify_alerts_configured
  ]
}
