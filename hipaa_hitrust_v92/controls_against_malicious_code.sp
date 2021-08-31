benchmark "hipaa_hitrust_v92_controls_against_malicious_code" {
  title         = "Controls Against Malicious Code"
  children = [
    benchmark.hipaa_hitrust_v92_0201_09j1organizational_124_09_j
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0201_09j1organizational_124_09_j" {
  title         = "Anti-virus and anti-spyware are installed, operating and updated"
  description   = "Anti-virus and anti-spyware are installed, operating and updated on all end-user devices to conduct periodic scans of the systems to identify and remove unauthorized software. Server environments for which the server software developer specifically recommends not installing host-based anti-virus and anti-spyware software may address the requirement via a network-based malware detection (NBMD) solution."
  children = [
    control.compute_vm_adaptive_application_controls_enabled,
    control.compute_vm_malware_agent_automatic_upgrade_enabled,
    control.compute_vm_malware_agent_installed,
    control.compute_vm_system_updates_installed,
    control.compute_vm_endpoint_protection_agent_installed
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}