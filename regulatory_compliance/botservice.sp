locals {
  regulatory_compliance_botservice_common_tags = {
    service = "Azure/BotService"
  }
}

control "bot_service_encrypted_with_cmk" {
  title       = "Bot Service should be encrypted with a customer-managed key"
  description = "Azure Bot Service automatically encrypts your resource to protect your data and meet organizational security and compliance commitments. By default, Microsoft-managed encryption keys are used. For greater flexibility in managing keys or controlling access to your subscription, select customer-managed keys, also known as bring your own key (BYOK). Learn more about Azure Bot Service encryption: https://docs.microsoft.com/azure/bot-service/bot-service-encryption."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_botservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}
