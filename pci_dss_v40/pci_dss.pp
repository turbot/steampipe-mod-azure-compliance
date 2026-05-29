locals {
  pci_dss_v40_common_tags = merge(local.azure_compliance_common_tags, {
    pci_dss_v40 = "true"
    type         = "Benchmark"
  })
}

benchmark "pci_dss_v40" {
  title         = "Azure PCI DSS 4.0"
  description   = "The PCI DSS applies to all entities that store, process, and/or transmit cardholder data. It covers technical and operational system components included in or connected to cardholder data. If you accept or process payment cards, PCI DSS applies to you."
  documentation = file("./pci_dss_v40/docs/pci_dss_v40_overview.md")

  children = [
    benchmark.pci_dss_v40_requirement_1,
    benchmark.pci_dss_v40_requirement_3,
    benchmark.pci_dss_v40_requirement_5,
    benchmark.pci_dss_v40_requirement_6,
    benchmark.pci_dss_v40_requirement_7,
    benchmark.pci_dss_v40_requirement_8,
    benchmark.pci_dss_v40_requirement_10,
    benchmark.pci_dss_v40_requirement_11
  ]

  tags = local.pci_dss_v40_common_tags
}
