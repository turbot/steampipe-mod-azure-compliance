benchmark "hipaa_hitrust_v92_endpoint_protection" {
  title       = "02 Endpoint Protection"
  description = "Anti-virus and anti-spyware are installed, operating and updated on all end-user devices to conduct periodic scans of the systems to identify and remove unauthorized software. Server environments for which the server software developer specifically recommends not installing host-based anti-virus and anti-spyware software are addressed via a network-based malware detection (NBMD) solution."
  children = [
    benchmark.hipaa_hitrust_v92_0201_09j1organizational
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0201_09j1organizational" {
  title       = "0201.09j1Organizational.124-09.j 09.04 Protection Against Malicious and Mobile Code"
  description = "Anti-virus and anti-spyware are installed, operating and updated on all end-user devices to conduct periodic scans of the systems to identify and remove unauthorized software. Server environments for which the server software developer specifically recommends not installing host-based anti-virus and anti-spyware software may address the requirement via a network-based malware detection (NBMD) solution."
  children = [
    control.compute_vm_adaptive_application_controls_enabled,
    control.compute_vm_endpoint_protection_agent_installed,
    control.compute_vm_malware_agent_automatic_upgrade_enabled,
    control.compute_vm_malware_agent_installed,
    control.compute_vm_scale_set_endpoint_protection_solution_installed,
    control.compute_vm_system_updates_installed
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}
