locals {
  fundamental_security_common_tags = merge(local.azure_compliance_common_tags, {
    fundamental_security = "true"
  })
}

benchmark "fundamental_security" {
  title       = "Fundamental Security"
  description = "The Fundamental Security is a set of controls that detect your deployed resources in the subscriptions deviating from security best practices."
  children = [
    benchmark.fundamental_security_activedirectory,
    benchmark.fundamental_security_apimanagement,
    benchmark.fundamental_security_appconfiguration,
    benchmark.fundamental_security_appservice,
    benchmark.fundamental_security_automation,
    benchmark.fundamental_security_batch,
    benchmark.fundamental_security_cognitiveservice,
    benchmark.fundamental_security_compute,
    benchmark.fundamental_security_containerinstance,
    benchmark.fundamental_security_containerregistry,
    benchmark.fundamental_security_cosmosdb,
    benchmark.fundamental_security_databoxedge,
    benchmark.fundamental_security_datafactory,
    benchmark.fundamental_security_datalakeanalytics,
    benchmark.fundamental_security_eventgrid,
    benchmark.fundamental_security_eventhub,
    benchmark.fundamental_security_frontdoor,
    benchmark.fundamental_security_hdinsight,
    benchmark.fundamental_security_healthcare,
    benchmark.fundamental_security_hpccache,
    benchmark.fundamental_security_iothub,
    benchmark.fundamental_security_keyvault,
    benchmark.fundamental_security_kubernetes,
    benchmark.fundamental_security_kusto,
    benchmark.fundamental_security_logic,
    benchmark.fundamental_security_machinelearning,
    benchmark.fundamental_security_mariadb,
    benchmark.fundamental_security_monitor,
    benchmark.fundamental_security_mysql,
    benchmark.fundamental_security_network,
    benchmark.fundamental_security_postgres,
    benchmark.fundamental_security_redis,
    benchmark.fundamental_security_search,
    benchmark.fundamental_security_securitycenter,
    benchmark.fundamental_security_servicebus,
    benchmark.fundamental_security_servicefabric,
    benchmark.fundamental_security_signalr,
    benchmark.fundamental_security_springcloud,
    benchmark.fundamental_security_sql,
    benchmark.fundamental_security_storage,
    benchmark.fundamental_security_storagesync,
    benchmark.fundamental_security_streamanalytics,
    benchmark.fundamental_security_synapse
  ]

  tags = merge(local.fundamental_security_common_tags, {
    type = "Benchmark"
  })
}
