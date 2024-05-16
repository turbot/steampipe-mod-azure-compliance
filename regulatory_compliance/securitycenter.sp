locals {
  regulatory_compliance_securitycenter_common_tags = {
    service = "Azure/SecurityCenter"
  }
}

control "securitycenter_automatic_provisioning_monitoring_agent_on" {
  title       = "Auto provisioning of the Log Analytics agent should be enabled on your subscription"
  description = "To monitor for security vulnerabilities and threats, Azure Security Center collects data from your Azure virtual machines. Data is collected by the Log Analytics agent, formerly known as the Microsoft Monitoring Agent (MMA), which reads various security-related configurations and event logs from the machine and copies the data to your Log Analytics workspace for analysis. We recommend enabling auto provisioning to automatically deploy the agent to all supported Azure VMs and any new ones that are created."
  query       = query.securitycenter_automatic_provisioning_monitoring_agent_on

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "securitycenter_notify_alerts_configured" {
  title       = "Email notification for high severity alerts should be enabled"
  description = "To ensure the relevant people in your organization are notified when there is a potential security breach in one of your subscriptions, enable email notifications for high severity alerts in Security Center."
  query       = query.securitycenter_notify_alerts_configured

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "securitycenter_security_alerts_to_owner_enabled" {
  title       = "Email notification to subscription owner for high severity alerts should be enabled"
  description = "To ensure your subscription owners are notified when there is a potential security breach in their subscription, set email notifications to subscription owners for high severity alerts in Security Center."
  query       = query.securitycenter_security_alerts_to_owner_enabled

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "securitycenter_email_configured" {
  title       = "Subscriptions should have a contact email address for security issues"
  description = "To ensure the relevant people in your organization are notified when there is a potential security breach in one of your subscriptions, set a security contact to receive email notifications from Security Center."
  query       = query.securitycenter_email_configured

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "securitycenter_azure_defender_on_for_sqlservervm" {
  title       = "Azure Defender for SQL should be enabled for unprotected SQL Managed Instances"
  description = "Audit each SQL Managed Instance without advanced data security."
  query       = query.securitycenter_azure_defender_on_for_sqlservervm

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "securitycenter_azure_defender_on_for_containers" {
  title       = "Microsoft Defender for Containers should be enabled"
  description = "Microsoft Defender for Containers provides hardening, vulnerability assessment and run-time protections for your Azure, hybrid, and multi-cloud Kubernetes environments."
  query       = query.securitycenter_azure_defender_on_for_containers

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "securitycenter_azure_defender_on_for_k8s" {
  title       = "Azure Defender for Kubernetes should be enabled"
  description = "Azure Defender for Kubernetes provides real-time threat protection for containerized environments and generates alerts for suspicious activities."
  query       = query.securitycenter_azure_defender_on_for_k8s

  tags = local.regulatory_compliance_securitycenter_common_tags
}

control "securitycenter_azure_defender_on_for_appservice" {
  title       = "Azure Defender for App Service should be enabled"
  description = "Azure Defender for App Service leverages the scale of the cloud, and the visibility that Azure has as a cloud provider, to monitor for common web app attacks."
  query       = query.securitycenter_azure_defender_on_for_appservice

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "securitycenter_azure_defender_on_for_keyvault" {
  title       = "Azure Defender for Key Vault should be enabled"
  description = "Azure Defender for Key Vault provides an additional layer of protection and security intelligence by detecting unusual and potentially harmful attempts to access or exploit key vault accounts."
  query       = query.securitycenter_azure_defender_on_for_keyvault

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "securitycenter_azure_defender_on_for_server" {
  title       = "Azure Defender for servers should be enabled"
  description = "Azure Defender for servers provides real-time threat protection for server workloads and generates hardening recommendations as well as alerts about suspicious activities."
  query       = query.securitycenter_azure_defender_on_for_server

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "securitycenter_azure_defender_on_for_sqldb" {
  title       = "Azure Defender for Azure SQL Database servers should be enabled"
  description = "Azure Defender for SQL provides functionality for surfacing and mitigating potential database vulnerabilities, detecting anomalous activities that could indicate threats to SQL databases, and discovering and classifying sensitive data."
  query       = query.securitycenter_azure_defender_on_for_sqldb

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "securitycenter_azure_defender_on_for_storage" {
  title       = "Microsoft Defender for Storage (Classic) should be enabled"
  description = "Azure Defender for Storage provides detections of unusual and potentially harmful attempts to access or exploit storage accounts."
  query       = query.securitycenter_azure_defender_on_for_storage

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "securitycenter_azure_defender_on_for_containerregistry" {
  title       = "Azure Defender for container registries should be enabled"
  description = "Azure Defender for container registries provides vulnerability scanning of any images pulled within the last 30 days, pushed to your registry, or imported, and exposes detailed findings per image."
  query       = query.securitycenter_azure_defender_on_for_containerregistry

  tags = local.regulatory_compliance_securitycenter_common_tags
}

control "securitycenter_azure_defender_on_for_dns" {
  title       = "Azure Defender for DNS should be enabled"
  description = "Azure Defender for DNS provides an additional layer of protection for your cloud resources by continuously monitoring all DNS queries from your Azure resources. Azure Defender alerts you about suspicious activity at the DNS layer."
  query       = query.securitycenter_azure_defender_on_for_dns

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "securitycenter_azure_defender_on_for_resource_manager" {
  title       = "Azure Defender for Resource Manager should be enabled"
  description = "Azure Defender for Resource Manager automatically monitors the resource management operations in your organization. Azure Defender detects threats and alerts you about suspicious activity."
  query       = query.securitycenter_azure_defender_on_for_resource_manager

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "securitycenter_pricing_standard" {
  title       = "Security center pricing should be set to standard"
  description = "This control checks whether Security center pricing is set to standard. This control is non-compliant if pricing is set to free."
  query       = query.securitycenter_pricing_standard

  tags = local.regulatory_compliance_securitycenter_common_tags
}

control "securitycenter_additional_email_configured" {
  title       = "Ensure 'Additional email addresses' is configured with a security contact email"
  description = "Security Center emails the subscription owners whenever a high-severity alert is triggered for their subscription. You should provide a security contact email address as an additional email address."
  query       = query.securitycenter_additional_email_configured

  tags = local.regulatory_compliance_securitycenter_common_tags
}

control "securitycenter_asc_default_setting_not_disabled" {
  title       = "Ensure any of the ASC Default policy setting is not set to \"Disabled\""
  description = "None of the settings offered by ASC Default policy should be set to effect \"Disabled\"."
  query       = query.securitycenter_asc_default_setting_not_disabled

  tags = local.regulatory_compliance_securitycenter_common_tags
}

control "securitycenter_azure_defender_on_for_cosmosdb" {
  title       = "Ensure That Microsoft Defender for Azure Cosmos DB is set to 'On'"
  description = "Microsoft Defender for Azure Cosmos DB scans all incoming network requests for threats to your Azure Cosmos DB resources."
  query       = query.securitycenter_azure_defender_on_for_cosmosdb

  tags = local.regulatory_compliance_securitycenter_common_tags
}

control "securitycenter_azure_defender_on_for_database" {
  title       = "Ensure That Microsoft Defender for Databases is set to 'On'"
  description = "Turning on Microsoft Defender for Databases enables threat detection for the instances running your database software. This provides threat intelligence, anomaly detection, and behavior analytics in the Azure Microsoft Defender for Cloud. Instead of being enabled on services like Platform as a Service (PaaS), this implementation will run within your instances as Infrastructure as a Service (IaaS) on the Operating Systems hosting your databases."
  query       = query.securitycenter_azure_defender_on_for_database

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_171_rev_2 = "true"
  })
}

control "securitycenter_azure_defender_on_for_opensource_relational_db" {
  title       = "Ensure That Microsoft Defender for Open-Source Relational Databases is set to 'On'"
  description = "Turning on Microsoft Defender for Open-source relational databases enables threat detection for Open-source relational databases, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  query       = query.securitycenter_azure_defender_on_for_opensource_relational_db

  tags = local.regulatory_compliance_securitycenter_common_tags
}

control "securitycenter_mcas_integration" {
  title       = "Ensure that Microsoft Defender for Cloud Apps (MCAS) Integration with Microsoft Defender for Cloud is selected"
  description = "This setting enables Microsoft Defender for Cloud Apps (MCAS) integration with Microsoft Defender for Cloud."
  query       = query.securitycenter_mcas_integration

  tags = local.regulatory_compliance_securitycenter_common_tags
}

control "securitycenter_wdatp_integration" {
  title       = "Ensure that Windows Defender ATP (WDATP) integration with Security Center is selected"
  description = "This setting enables Windows Defender ATP (WDATP) integration with Security Center."
  query       = query.securitycenter_wdatp_integration

  tags = local.regulatory_compliance_securitycenter_common_tags
}

control "securitycenter_container_image_scan_enabled" {
  title       = "Security Center container image scan should be enabled"
  description = "This control ensures that image scan for container registries are enabled."
  query       = query.securitycenter_container_image_scan_enabled

  tags = local.regulatory_compliance_securitycenter_common_tags
}

query "securitycenter_automatic_provisioning_monitoring_agent_on" {
  sql = <<-EOQ
    select
      sc_prov.id as resource,
      case
        when auto_provision = 'On' then 'ok'
        else 'alarm'
      end as status,
      case
        when auto_provision = 'On' then 'Automatic provisioning of monitoring agent is on.'
        else 'Automatic provisioning of monitoring agent is off.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sc_prov.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_auto_provisioning sc_prov
      right join azure_subscription sub on sc_prov.subscription_id = sub.subscription_id;
  EOQ
}

query "securitycenter_notify_alerts_configured" {
  sql = <<-EOQ
    with contact_info as (
      select
        count(*) filter (where alert_notifications = 'On') as notification_alert_count,
        subscription_id
      from
        azure_security_center_contact
      group by
        subscription_id
      limit 1
    )
    select
      sub.subscription_id as resource,
      case
        when notification_alert_count > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when notification_alert_count > 0 then '"Notify about alerts with the following severity" set to High.'
        else '"Notify about alerts with the following severity" not set to High.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription sub
      left join contact_info ci on sub.subscription_id = ci.subscription_id;
  EOQ
}

query "securitycenter_security_alerts_to_owner_enabled" {
  sql = <<-EOQ
    with contact_info as (
      select
        count(*) filter (where alerts_to_admins = 'On') as admin_alert_count,
        subscription_id
      from
        azure_security_center_contact
      group by
        subscription_id
      limit 1
    )
    select
      sub.subscription_id as resource,
      case
        when admin_alert_count > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when admin_alert_count > 0 then '"All users with the following roles" set to Owner'
        else '"All users with the following roles" not set to Owner.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription sub
      left join contact_info ci on sub.subscription_id = ci.subscription_id;
  EOQ
}

query "securitycenter_email_configured" {
  sql = <<-EOQ
    with contact_info as (
      select
        jsonb_agg(email) filter (where name = 'default' and email != '') as default_email,
        count(*) filter (where name != 'default') as non_default_count,
        count(*) filter (where name = 'default') as default_count,
        subscription_id
      from
        azure_security_center_contact
      group by
        subscription_id
      limit 1
    )
    select
      sub.subscription_id as resource,
      case
        when non_default_count > 0 then 'ok'
        when default_count = 1 and jsonb_array_length(default_email) != 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when non_default_count > 0 then 'Additional email addresses configured.'
        when default_count = 1 and default_email is not null then'Additional email addresses configured.'
        else 'Additional email addresses not configured.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription sub
      left join contact_info ci on sub.subscription_id = ci.subscription_id;
  EOQ
}

query "securitycenter_azure_defender_on_for_sqlservervm" {
  sql = <<-EOQ
    select
      sub_pricing.id as resource,
      case
        when pricing_tier = 'Standard' then 'ok'
        else 'alarm'
      end as status,
      case
        when pricing_tier = 'Standard' then 'Azure Defender on for SQL servers on machines.'
        else 'Azure Defender off for SQL servers on machines.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub_pricing.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_subscription_pricing sub_pricing
      right join azure_subscription sub on sub_pricing.subscription_id = sub.subscription_id
    where
      name = 'SqlServerVirtualMachines';
  EOQ
}

query "securitycenter_additional_email_configured" {
  sql = <<-EOQ
    with contact_info as (
      select
        jsonb_agg(email) filter (where name = 'default' and email != '') as default_email,
        count(*) filter (where name != 'default') as non_default_count,
        count(*) filter (where name = 'default') as default_count,
        subscription_id
      from
        azure_security_center_contact
      group by
        subscription_id
      limit 1
    )
    select
      sub.subscription_id as resource,
      case
        when non_default_count > 0 then 'ok'
        when default_count = 1 and jsonb_array_length(default_email) != 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when non_default_count > 0 then 'Additional email addresses configured.'
        when default_count = 1 and default_email is not null then'Additional email addresses configured.'
        else 'Additional email addresses not configured.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription sub
      left join contact_info ci on sub.subscription_id = ci.subscription_id;
  EOQ
}

query "securitycenter_asc_default_setting_not_disabled" {
  sql = <<-EOQ
    with policy_assignment_parameters as (
      select
        id,
        name,
        key,
        parameters -> key ->> 'value' as value,
        subscription_id
      from
        azure_policy_assignment,
        jsonb_object_keys(parameters) as key
      where
        name = 'SecurityCenterBuiltIn'
    )
    select
      sub.id as resource,
      case
        when count(value = 'Disabled') > 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when count(value = 'Disabled') > 0 then 'Settings disabled for ' || count(*) filter (where value = 'Disabled') || ' parameters.'
        else 'Settings enabled for all the parameters.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      policy_assignment_parameters pol_assignment
      right join azure_subscription sub on pol_assignment.subscription_id = sub.subscription_id
    group by
      sub.id,
      pol_assignment.id,
      sub._ctx,
      sub.subscription_id,
      pol_assignment.subscription_id,
      sub.display_name;
  EOQ
}

query "securitycenter_azure_defender_on_for_appservice" {
  sql = <<-EOQ
    select
      sub_pricing.id as resource,
      case
        when pricing_tier = 'Standard' then 'ok'
        else 'alarm'
      end as status,
      case
        when pricing_tier = 'Standard' then 'Azure Defender on for App Services.'
        else 'Azure Defender off for App Services.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub_pricing.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_subscription_pricing sub_pricing
      right join azure_subscription sub on sub_pricing.subscription_id = sub.subscription_id
    where
      name = 'AppServices';
  EOQ
}

query "securitycenter_azure_defender_on_for_containerregistry" {
  sql = <<-EOQ
    select
      sub_pricing.id as resource,
      case
        when pricing_tier = 'Standard' then 'ok'
        else 'alarm'
      end as status,
      case
        when pricing_tier = 'Standard' then 'Azure Defender on for Container Registry.'
        else 'Azure Defender off for Container Registry.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub_pricing.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_subscription_pricing sub_pricing
      right join azure_subscription sub on sub_pricing.subscription_id = sub.subscription_id
    where
      name = 'ContainerRegistry';
  EOQ
}

query "securitycenter_azure_defender_on_for_cosmosdb" {
  sql = <<-EOQ
    select
      sub_pricing.id as resource,
      case
        when pricing_tier = 'Standard' then 'ok'
        else 'alarm'
      end as status,
      case
        when pricing_tier = 'Standard' then 'Azure Defender on for Cosmos DB.'
        else 'Azure Defender off for Cosmos DB.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub_pricing.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_subscription_pricing sub_pricing
      right join azure_subscription sub on sub_pricing.subscription_id = sub.subscription_id
    where
      name = 'CosmosDbs';
  EOQ
}

query "securitycenter_azure_defender_on_for_database" {
  sql = <<-EOQ
    with defender_list as (
      select
        json_object_agg(name, pricing_tier) as data,
        subscription_id
      from
        azure_security_center_subscription_pricing
      where
        name = any(ARRAY ['CosmosDbs', 'OpenSourceRelationalDatabases', 'SqlServerVirtualMachines', 'SqlServers'])
      group by
        subscription_id
    )
    select
      sub.id as resource,
      case
        when
          data ->> 'CosmosDbs' = 'Standard'
          and data ->> 'OpenSourceRelationalDatabases' = 'Standard'
          and data ->> 'SqlServerVirtualMachines' = 'Standard'
          and data ->> 'SqlServers' = 'Standard'
          then 'ok'
        else 'alarm'
      end as status,
      case
        when
          data ->> 'CosmosDbs' = 'Standard'
          and data ->> 'OpenSourceRelationalDatabases' = 'Standard'
          and data ->> 'SqlServerVirtualMachines' = 'Standard'
          and data ->> 'SqlServers' = 'Standard'
          then 'Azure Defender on for Databases.'
        else 'Azure Defender off for Databases.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription as sub
      left join defender_list as l on l.subscription_id = sub.subscription_id;
  EOQ
}

query "securitycenter_azure_defender_on_for_dns" {
  sql = <<-EOQ
    select
      sub_pricing.id as resource,
      case
        when pricing_tier = 'Standard' then 'ok'
        else 'alarm'
      end as status,
      case
        when pricing_tier = 'Standard' then 'Azure Defender on for DNS.'
        else 'Azure Defender off for DNS.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub_pricing.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_subscription_pricing sub_pricing
      right join azure_subscription sub on sub_pricing.subscription_id = sub.subscription_id
    where
      name = 'Dns';
  EOQ
}

query "securitycenter_azure_defender_on_for_k8s" {
  sql = <<-EOQ
    select
      sub_pricing.id as resource,
      case
        when pricing_tier = 'Standard' then 'ok'
        else 'alarm'
      end as status,
      case
        when pricing_tier = 'Standard' then 'Azure Defender on for Kubernetes.'
        else 'Azure Defender off for Kubernetes.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub_pricing.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_subscription_pricing sub_pricing
      right join azure_subscription sub on sub_pricing.subscription_id = sub.subscription_id
    where
      name = 'KubernetesService';
  EOQ
}

query "securitycenter_azure_defender_on_for_keyvault" {
  sql = <<-EOQ
    select
      sub_pricing.id as resource,
      case
        when pricing_tier = 'Standard' then 'ok'
        else 'alarm'
      end as status,
      case
        when pricing_tier = 'Standard' then 'Azure Defender on for Key Vaults.'
        else 'Azure Defender off for Key Vaults.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub_pricing.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_subscription_pricing sub_pricing
      right join azure_subscription sub on sub_pricing.subscription_id = sub.subscription_id
    where
      name = 'KeyVaults';
  EOQ
}

query "securitycenter_azure_defender_on_for_opensource_relational_db" {
  sql = <<-EOQ
    select
      sub_pricing.id as resource,
      case
        when pricing_tier = 'Standard' then 'ok'
        else 'alarm'
      end as status,
      case
        when pricing_tier = 'Standard' then 'Azure Defender on for Open Source Relational Databases.'
        else 'Azure Defender off for Open Source Relational Databases.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub_pricing.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_subscription_pricing sub_pricing
      right join azure_subscription sub on sub_pricing.subscription_id = sub.subscription_id
    where
      name = 'OpenSourceRelationalDatabases';
  EOQ
}

query "securitycenter_azure_defender_on_for_resource_manager" {
  sql = <<-EOQ
    select
      sub_pricing.id as resource,
      case
        when pricing_tier = 'Standard' then 'ok'
        else 'alarm'
      end as status,
      case
        when pricing_tier = 'Standard' then 'Azure Defender on for Resource Manager.'
        else 'Azure Defender off for Resource Manager.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub_pricing.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_subscription_pricing sub_pricing
      right join azure_subscription sub on sub_pricing.subscription_id = sub.subscription_id
    where
      name = 'Arm';
  EOQ
}

query "securitycenter_azure_defender_on_for_server" {
  sql = <<-EOQ
    select
      sub_pricing.id as resource,
      case
        when pricing_tier = 'Standard' then 'ok'
        else 'alarm'
      end as status,
      case
        when pricing_tier = 'Standard' then 'Azure Defender on for Servers.'
        else 'Azure Defender off for Servers.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub_pricing.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_subscription_pricing sub_pricing
      right join azure_subscription sub on sub_pricing.subscription_id = sub.subscription_id
    where
      name = 'VirtualMachines';
  EOQ
}

query "securitycenter_azure_defender_on_for_sqldb" {
  sql = <<-EOQ
    select
      sub_pricing.id as resource,
      case
        when pricing_tier = 'Standard' then 'ok'
        else 'alarm'
      end as status,
      case
        when pricing_tier = 'Standard' then 'Azure Defender on for SQL database servers.'
        else 'Azure Defender off for SQL database servers.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub_pricing.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_subscription_pricing sub_pricing
      right join azure_subscription sub on sub_pricing.subscription_id = sub.subscription_id
    where
      name = 'SqlServers';
  EOQ
}

query "securitycenter_azure_defender_on_for_storage" {
  sql = <<-EOQ
    select
      sub_pricing.id as resource,
      case
        when pricing_tier = 'Standard' then 'ok'
        else 'alarm'
      end as status,
      case
        when pricing_tier = 'Standard' then 'Azure Defender on for Storage.'
        else 'Azure Defender off for Storage.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub_pricing.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_subscription_pricing sub_pricing
      right join azure_subscription sub on sub_pricing.subscription_id = sub.subscription_id
    where
      name = 'StorageAccounts';
  EOQ
}

query "securitycenter_mcas_integration" {
  sql = <<-EOQ
    select
      sc_sett.id as resource,
      case
        when enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when enabled then 'Windows Defender ATP (WDATP) integrated with Security Center.'
        else 'Windows Defender ATP (WDATP) not integrated with Security Center.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sc_sett.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_setting sc_sett
      right join azure_subscription sub on sc_sett.subscription_id = sub.subscription_id
    where
      name = 'MCAS';
  EOQ
}

query "securitycenter_wdatp_integration" {
  sql = <<-EOQ
    select
      sc_sett.id as resource,
      case
        when enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when enabled then 'Microsoft Cloud App Security (MCAS) integrated with Security Center.'
        else 'Microsoft Cloud App Security (MCAS) not integrated with Security Center.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sc_sett.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_setting sc_sett
      right join azure_subscription sub on sc_sett.subscription_id = sub.subscription_id
    where
      name = 'WDATP';
  EOQ
}

query "securitycenter_azure_defender_on_for_containers" {
  sql = <<-EOQ
    select
      sub_pricing.id as resource,
      case
        when pricing_tier = 'Standard' then 'ok'
        else 'alarm'
      end as status,
      case
        when pricing_tier = 'Standard' then 'Azure Defender on for Containers.'
        else 'Azure Defender off for Containers.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub_pricing.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_subscription_pricing sub_pricing
      right join azure_subscription sub on sub_pricing.subscription_id = sub.subscription_id
    where
      name = 'Containers';
  EOQ
}

query "securitycenter_pricing_standard" {
  sql = <<-EOQ
    select
      sub_pricing.id as resource,
      case
        when pricing_tier = 'Standard' then 'ok'
        else 'alarm'
      end as status,
      sub_pricing.name || ' is using ' || pricing_tier || ' pricing tier.' as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub_pricing.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_subscription_pricing sub_pricing
      right join azure_subscription sub on sub_pricing.subscription_id = sub.subscription_id;
  EOQ
}

query "securitycenter_container_image_scan_enabled" {
  sql = <<-EOQ
    select
      sub_assessment.id as resource,
      case
        when container_registry_vulnerability_properties ->> 'AssessedResourceType' = 'ContainerRegistryVulnerability' then 'ok'
        else 'alarm'
      end as status,
      case
        when container_registry_vulnerability_properties ->> 'AssessedResourceType' = 'ContainerRegistryVulnerability' then sub_assessment.name || ' container image scan enabled.'
        else sub_assessment.name || ' container image scan disabled.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "sub_pricing.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_sub_assessment sub_assessment
      right join azure_subscription sub on sub_assessment.subscription_id = sub.subscription_id;
  EOQ
}
