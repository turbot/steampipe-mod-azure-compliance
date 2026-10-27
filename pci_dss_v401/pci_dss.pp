locals {
  pci_dss_v401_common_tags = merge(local.azure_compliance_common_tags, {
    pci_dss_v40 = "true"
    type         = "Benchmark"
  })
}

benchmark "pci_dss_v401" {
  title         = "Azure PCI DSS 4.0.1"
  description   = "The PCI DSS applies to all entities that store, process, and/or transmit cardholder data. It covers technical and operational system components included in or connected to cardholder data. If you accept or process payment cards, PCI DSS applies to you."
  documentation = file("./pci_dss_v401/docs/pci_dss_v401_overview.md")

  children = [
    benchmark.pci_dss_v401_requirement_1,
    benchmark.pci_dss_v401_requirement_2,
    benchmark.pci_dss_v401_requirement_3,
    benchmark.pci_dss_v401_requirement_4,
    benchmark.pci_dss_v401_requirement_5,
    benchmark.pci_dss_v401_requirement_6,
    benchmark.pci_dss_v401_requirement_7,
    benchmark.pci_dss_v401_requirement_8,
    benchmark.pci_dss_v401_requirement_9,
    benchmark.pci_dss_v401_requirement_10,
    benchmark.pci_dss_v401_requirement_11,
    benchmark.pci_dss_v401_requirement_12
  ]

  tags = local.pci_dss_v401_common_tags
}
