locals {
  other_common_tags = merge(local.azure_compliance_common_tags, {
    other_checks = "true"
  })
}

benchmark "other" {
  title         = "Other Compliance Checks"
  documentation = file("./other_checks/docs/other_checks_overview.md")
  children = [
    benchmark.other_aks,
    benchmark.other_apimanagement,
    benchmark.other_appconfiguration,
    benchmark.other_appservice,
    benchmark.other_cognitivesearch,
    benchmark.other_compute,
    benchmark.other_containerinstance,
    benchmark.other_containerregistry,
    benchmark.other_cosmosdb,
    benchmark.other_dataexplorer,
    benchmark.other_datafactory,
    benchmark.other_eventgrid,
    benchmark.other_keyvault,
    benchmark.other_mariadb,
    benchmark.other_monitor,
    benchmark.other_postgres,
    benchmark.other_redis,
    benchmark.other_securitycenter,
    benchmark.other_signalr,
    benchmark.other_sql,
    benchmark.other_synapse,
  ]

  tags = merge(local.other_common_tags, {
    type = "Benchmark"
  })
}
