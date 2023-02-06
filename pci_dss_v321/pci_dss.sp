locals {
  pci_dss_v321_common_tags = merge(local.azure_compliance_common_tags, {
    pci_dss_v321 = "true"
    type         = "Benchmark"
  })
}

benchmark "pci_dss_v321" {
  title       = "PCI DSS 3.2.1"
  description = "The PCI DSS applies to all entities that store, process, and/or transmit cardholder data. It covers technical and operational system components included in or connected to cardholder data. If you accept or process payment cards, PCI DSS applies to you."
  children = [
    benchmark.pci_dss_v321_requirement_1,
    benchmark.pci_dss_v321_requirement_3,
    benchmark.pci_dss_v321_requirement_4,
    benchmark.pci_dss_v321_requirement_5,
    benchmark.pci_dss_v321_requirement_6
  ]
  tags = local.pci_dss_v321_common_tags
}
