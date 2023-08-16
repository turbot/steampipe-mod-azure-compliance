locals {
  fundamental_security_cognitiveservice_common_tags = merge(local.fundamental_security_common_tags, {
    service = "Azure/CognitiveServices"
  })
}

benchmark "fundamental_security_cognitiveservice" {
  title       = "Cognitive Services"
  description = "This section contains recommendations for configuring CognitiveServices resources."
  children = [
    control.cognitive_account_encrypted_with_cmk,
    control.cognitive_account_private_link_used,
    control.cognitive_account_public_network_access_disabled,
    control.cognitive_account_restrict_public_access,
    control.cognitive_service_local_auth_disabled
  ]

  tags = merge(local.fundamental_security_cognitiveservice_common_tags, {
    type = "Benchmark"
  })
}
