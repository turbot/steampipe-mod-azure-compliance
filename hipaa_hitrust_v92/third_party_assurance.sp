benchmark "hipaa_hitrust_v92_third_party_assurance" {
  title       = "14 Third Party Assurance"
  description = "Where software development is outsourced, the development process is monitored by the organization and includes independent security and code reviews."
  children = [
    benchmark.hipaa_hitrust_v92_1450_05i2organizational,
    benchmark.hipaa_hitrust_v92_1451_05icsporganizational
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1450_05i2organizational" {
  title       = "1450.05i2Organizational.2-05.i 05.02 External Parties"
  description = "The organization obtains satisfactory assurances that reasonable information security exists across their information supply chain by performing an annual review, which includes all partners/third party-providers upon which their information supply chain depends."
  children = [
    control.postgres_sql_ssl_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/PostgreSQL"
  })
}

benchmark "hipaa_hitrust_v92_1451_05icsporganizational" {
  title       = "1451.05iCSPOrganizational.2-05.i 05.02 External Parties"
  description = "Cloud service providers design and implement controls to mitigate and contain data security risks through proper separation of duties, role-based access, and least-privilege access for all personnel within their supply chain."
  children = [
    control.azure_redis_cache_ssl_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Redis"
  })
}
