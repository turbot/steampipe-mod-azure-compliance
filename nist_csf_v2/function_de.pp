benchmark "nist_csf_v2_de" {
  title       = "Detect (DE)"
  description = "Possible cybersecurity attacks and compromises are found and analyzed."
  children = [
    benchmark.nist_csf_v2_de_cm,
    benchmark.nist_csf_v2_de_ae
  ]
}

# Continuous Monitoring (DE.CM)
benchmark "nist_csf_v2_de_cm" {
  title       = "Continuous Monitoring (DE.CM)"
  description = "Assets are monitored to find anomalies, indicators of compromise, and other potentially adverse events."
  children = [
    benchmark.nist_csf_v2_de_cm_01,
    benchmark.nist_csf_v2_de_cm_02,
    benchmark.nist_csf_v2_de_cm_03,
    benchmark.nist_csf_v2_de_cm_06,
    benchmark.nist_csf_v2_de_cm_09
  ]
}

benchmark "nist_csf_v2_de_cm_01" {
  title       = "DE.CM-01"
  description = "Networks and network services are monitored to find potentially adverse events."
  children = [
    control.securitycenter_automatic_provisioning_monitoring_agent_on
  ]
}

benchmark "nist_csf_v2_de_cm_02" {
  title       = "DE.CM-02"
  description = "The physical environment is monitored to find potentially adverse events."
  children = [
    control.securitycenter_automatic_provisioning_monitoring_agent_on
  ]
}

benchmark "nist_csf_v2_de_cm_03" {
  title       = "DE.CM-03"
  description = "Personnel activity and technology usage are monitored to find potentially adverse events."
  children = [
    control.securitycenter_automatic_provisioning_monitoring_agent_on
  ]
}

benchmark "nist_csf_v2_de_cm_06" {
  title       = "DE.CM-06"
  description = "External service provider activities and services are monitored to find potentially adverse events."
  children = [
    control.securitycenter_automatic_provisioning_monitoring_agent_on
  ]
}

benchmark "nist_csf_v2_de_cm_09" {
  title       = "DE.CM-09"
  description = "Computing hardware and software, runtime environments, and their data are monitored to find potentially adverse events."
  children = [
    control.securitycenter_automatic_provisioning_monitoring_agent_on
  ]
}

# Adverse Event Analysis (DE.AE)
benchmark "nist_csf_v2_de_ae" {
  title       = "Adverse Event Analysis (DE.AE)"
  description = "Anomalies, indicators of compromise, and other potentially adverse events are analyzed to characterize the events and detect cybersecurity incidents."
  children = [
    benchmark.nist_csf_v2_de_ae_02,
    benchmark.nist_csf_v2_de_ae_03,
    benchmark.nist_csf_v2_de_ae_04,
    benchmark.nist_csf_v2_de_ae_06,
    benchmark.nist_csf_v2_de_ae_07,
    benchmark.nist_csf_v2_de_ae_08
  ]
}

benchmark "nist_csf_v2_de_ae_02" {
  title       = "DE.AE-02"
  description = "Potentially adverse events are analyzed to better understand associated activities."
  children = [
    control.securitycenter_automatic_provisioning_monitoring_agent_on
  ]
}

benchmark "nist_csf_v2_de_ae_03" {
  title       = "DE.AE-03"
  description = "Information is correlated from multiple sources."
  children = [
    control.securitycenter_automatic_provisioning_monitoring_agent_on
  ]
}

benchmark "nist_csf_v2_de_ae_04" {
  title       = "DE.AE-04"
  description = "The estimated impact and scope of adverse events are understood."
  children = [
    control.securitycenter_automatic_provisioning_monitoring_agent_on
  ]
}

benchmark "nist_csf_v2_de_ae_06" {
  title       = "DE.AE-06"
  description = "Information on adverse events is provided to authorized staff and tools."
  children = [
    control.securitycenter_notify_alerts_configured
  ]
}

benchmark "nist_csf_v2_de_ae_07" {
  title       = "DE.AE-07"
  description = "Cyber threat intelligence and other contextual information are integrated into the analysis."
  children = [
    control.securitycenter_automatic_provisioning_monitoring_agent_on
  ]
}

benchmark "nist_csf_v2_de_ae_08" {
  title       = "DE.AE-08"
  description = "Incidents are declared when adverse events meet the defined incident criteria."
  children = [
    control.securitycenter_notify_alerts_configured
  ]
} 