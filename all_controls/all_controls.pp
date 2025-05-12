locals {
  all_controls_common_tags = merge(local.azure_compliance_common_tags, {
    type = "Benchmark"
  })
}
benchmark "all_controls" {
  title       = "All Controls"
  description = "This benchmark contains all controls grouped by service to help you detect resource configurations that do not meet best practices."
  children = [
    benchmark.all_controls_activedirectory,
    benchmark.all_controls_apimanagement,
    benchmark.all_controls_appconfiguration,
    benchmark.all_controls_appservice,
    benchmark.all_controls_automation,
    benchmark.all_controls_batch,
    benchmark.all_controls_cognitivesearch,
    benchmark.all_controls_cognitiveservice,
    benchmark.all_controls_compute,
    benchmark.all_controls_containerinstance,
    benchmark.all_controls_containerregistry,
    benchmark.all_controls_cosmosdb,
    benchmark.all_controls_databoxedge,
    benchmark.all_controls_databricks,
    benchmark.all_controls_datafactory,
    benchmark.all_controls_datalakeanalytics,
    benchmark.all_controls_datalakestore,
    benchmark.all_controls_eventgrid,
    benchmark.all_controls_eventhub,
    benchmark.all_controls_frontdoor,
    benchmark.all_controls_hdinsight,
    benchmark.all_controls_healthcare,
    benchmark.all_controls_hpccache,
    benchmark.all_controls_iothub,
    benchmark.all_controls_keyvault,
    benchmark.all_controls_kubernetes,
    benchmark.all_controls_kusto,
    benchmark.all_controls_logic,
    benchmark.all_controls_machinelearning,
    benchmark.all_controls_mariadb,
    benchmark.all_controls_monitor,
    benchmark.all_controls_mysql,
    benchmark.all_controls_network,
    benchmark.all_controls_postgres,
    benchmark.all_controls_recoveryservice,
    benchmark.all_controls_redis,
    benchmark.all_controls_securitycenter,
    benchmark.all_controls_servicebus,
    benchmark.all_controls_servicefabric,
    benchmark.all_controls_signalr,
    benchmark.all_controls_springcloud,
    benchmark.all_controls_sql,
    benchmark.all_controls_storage,
    benchmark.all_controls_storagesync,
    benchmark.all_controls_streamanalytics,
    benchmark.all_controls_synapse
  ]

  tags = local.all_controls_common_tags
}
