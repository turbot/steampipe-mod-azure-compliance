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
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "securitycenter_notify_alerts_configured" {
  title       = "Email notification for high severity alerts should be enabled"
  description = "To ensure the relevant people in your organization are notified when there is a potential security breach in one of your subscriptions, enable email notifications for high severity alerts in Security Center."
  query       = query.securitycenter_notify_alerts_configured

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "securitycenter_security_alerts_to_owner_enabled" {
  title       = "Email notification to subscription owner for high severity alerts should be enabled"
  description = "To ensure your subscription owners are notified when there is a potential security breach in their subscription, set email notifications to subscription owners for high severity alerts in Security Center."
  query       = query.securitycenter_security_alerts_to_owner_enabled

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "securitycenter_email_configured" {
  title       = "Subscriptions should have a contact email address for security issues"
  description = "To ensure the relevant people in your organization are notified when there is a potential security breach in one of your subscriptions, set a security contact to receive email notifications from Security Center."
  query       = query.securitycenter_email_configured

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "securitycenter_azure_defender_on_for_sqlservervm" {
  title       = "Azure Defender for SQL should be enabled for unprotected SQL Managed Instances"
  description = "Audit each SQL Managed Instance without advanced data security."
  query       = query.securitycenter_azure_defender_on_for_sqlservervm

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "securitycenter_azure_defender_on_for_containers" {
  title       = "Microsoft Defender for Containers should be enabled"
  description = "Microsoft Defender for Containers provides hardening, vulnerability assessment and run-time protections for your Azure, hybrid, and multi-cloud Kubernetes environments."
  query       = query.securitycenter_azure_defender_on_for_containers

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
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