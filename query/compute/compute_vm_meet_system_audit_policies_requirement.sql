select
  -- Required Columns
  vm.id as resource,
  case
    when image_publisher = any(ARRAY
      ['esri', 'incredibuild', 'MicrosoftDynamicsAX', 'MicrosoftSharepoint', 'MicrosoftVisualStudio', 'MicrosoftWindowsDesktop',
      'MicrosoftWindowsServerHPCPack'])
    then 'ok'
    when image_publisher = 'MicrosoftWindowsServer' and image_sku not like '2008%' then 'ok'
    when image_publisher = 'MicrosoftSQLServer' and image_offer not like 'SQL2008%' then 'ok'
    when image_publisher = 'microsoft-dsvm' and image_offer = 'dsvm-windows' then 'ok'
    when image_publisher = '"microsoft-ads' and image_offer = any(ARRAY ['standard-data-science-vm', 'windows-data-science-vm']) then 'ok'
    when image_publisher = 'batch' and image_offer = 'rendering-windows2016' then 'ok'
    when image_publisher = 'center-for-internet-security-inc' and image_offer like 'cis-windows-server-201%' then 'ok'
    when image_publisher = 'pivotal' and image_offer like 'bosh-windows-server%' then 'ok'
    when image_publisher = 'cloud-infrastructure-services' and image_offer like 'ad%' then 'ok'
    when (os_type like 'Windows%' or provision_vm_agent_windows) and (image_sku is null or ( image_sku not like '2008%'and image_offer not like 'SQL2008%')) then 'ok'
    else 'alarm'
  end as status,
  case
     when image_publisher = any(ARRAY
      ['esri', 'incredibuild', 'MicrosoftDynamicsAX', 'MicrosoftSharepoint', 'MicrosoftVisualStudio', 'MicrosoftWindowsDesktop',
      'MicrosoftWindowsServerHPCPack'])
    then vm.title || ' meet requirements for system audit policies - detailed tracking.'
    when image_publisher = 'MicrosoftWindowsServer' and image_sku not like '2008%' then vm.title || ' meet requirements for system audit policies - detailed tracking.'
    when image_publisher = 'MicrosoftSQLServer' and image_offer not like 'SQL2008%' then vm.title || ' meet requirements for system audit policies - detailed tracking.'
    when image_publisher = 'microsoft-dsvm' and image_offer = 'dsvm-windows' then vm.title || ' meet requirements for system audit policies - detailed tracking.'
    when image_publisher = '"microsoft-ads' and image_offer = any(ARRAY ['standard-data-science-vm', 'windows-data-science-vm']) then vm.title || ' meet requirements for system audit policies - detailed tracking.'
    when image_publisher = 'batch' and image_offer = 'rendering-windows2016'  then vm.title || ' meet requirements for system audit policies - detailed tracking.'
    when image_publisher = 'center-for-internet-security-inc' and image_offer like 'cis-windows-server-201%' then vm.title || ' meet requirements for system audit policies - detailed tracking.'
    when image_publisher = 'pivotal' and image_offer like 'bosh-windows-server%' then vm.title || ' meet requirements for system audit policies - detailed tracking.'
    when image_publisher = 'cloud-infrastructure-services' and image_offer like 'ad%' then vm.title || ' meet requirements for system audit policies - detailed tracking.'
    when (os_type like 'Windows%' or provision_vm_agent_windows) and (image_sku is null or (image_sku not like '2008%'and image_offer not like 'SQL2008%')) then vm.title || ' meet requirements for system audit policies - detailed tracking.'
    else vm.title || ' does not meet requirements for system audit policies - detailed tracking.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_compute_virtual_machine vm,
  azure_subscription sub
where
  sub.subscription_id = vm.subscription_id;