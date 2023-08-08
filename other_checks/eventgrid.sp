locals {
  other_eventgrid_common_tags = merge(local.azure_compliance_common_tags, {
    service = "Azure/EventGrid"
  })
}

benchmark "other_eventgrid" {
  title = "Event Grid"
  children = [
    control.eventgrid_domain_identity_provider_enabled,
    control.eventgrid_domain_restrict_public_access,
    control.eventgrid_topic_identity_provider_enabled,
    control.eventgrid_topic_local_auth_enabled
  ]

  tags = merge(local.other_eventgrid_common_tags, {
    type = "Benchmark"
  })
}
