select
  -- Required Columns
  vm.vm_id as resource,
  case
    when os_type = 'Windows' then 'skip'
    when image_publisher = 'Canonical' and image_offer = 'UbuntuServer' and image_sku = any(array
      ['14.04.0-LTS', '14.04.1-LTS', '14.04.5-LTS', '16.04-LTS', '16.04.0-LTS', '18.04-LTS'])
    then 'ok'
    when image_publisher = 'RedHat' and image_offer = any(array ['RHEL', 'RHEL-SAP-HANA']) and image_sku like any (array ['6.%', '7%'])
    then 'ok'
    when image_publisher = 'SUSE' and image_offer = any(array ['SLES', 'SLES-HPC', 'SLES-HPC-Priority', 'SLES-SAP', 'SLES-SAP-BYOS', 'SLES-Priority', 'SLES-BYOS', 'SLES-SAPCAL', 'SLES-Standard']) and image_sku = any (array ['12-SP2', '12-SP3', '12-SP4'])
    then 'ok'
    when image_publisher = 'OpenLogic' and image_offer= any(array ['CentOS', 'Centos-LVML', 'CentOS-SRIOV']) and image_sku = any (array ['6.%', '7%'])
    then 'ok'
    when image_publisher = 'cloudera' and image_offer = 'cloudera-centos-os' and image_sku like '7%' then 'ok'
    else 'alarm'
  end as status,
  case
    when os_type = 'Windows' then vm.title || ' is ' || os_type || ' virtual machine.'
    when image_publisher = 'Canonical' and image_offer = 'UbuntuServer' and image_sku = any(ARRAY
      ['14.04.0-LTS', '14.04.1-LTS', '14.04.5-LTS', '16.04-LTS', '16.04.0-LTS', '18.04-LTS'])
    then vm.title || ' has network traffic data collection agent installed.'
    when image_publisher = 'RedHat' and image_offer = any(ARRAY [ 'RHEL', 'RHEL-SAP-HANA']) and image_sku like any (array ['6.%', '7%'])
    then vm.title || ' has network traffic data collection agent installed.'
    when image_publisher = 'SUSE' and image_offer = any(ARRAY [ 'SLES', 'SLES-HPC', 'SLES-HPC-Priority', 'SLES-SAP', 'SLES-SAP-BYOS', 'SLES-Priority', 'SLES-BYOS', 'SLES-SAPCAL', 'SLES-Standard']) and image_sku = any (array ['12-SP2', '12-SP3', '12-SP4'])
    then vm.title || ' has network traffic data collection agent installed.'
    when image_publisher = 'OpenLogic' and image_offer= any(ARRAY ['CentOS', 'Centos-LVML', 'CentOS-SRIOV']) and image_sku = any (array ['6.5', '7%'])
    then vm.title || ' has network traffic data collection agent installed.'
    when image_publisher = 'cloudera' and image_offer = 'cloudera-centos-os' and image_sku like '7%'
    then vm.title || ' has network traffic data collection agent installed.'
    else vm.title || ' does not have network traffic data collection agent installed.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_compute_virtual_machine vm,
  azure_subscription sub
where
  sub.subscription_id = vm.subscription_id;