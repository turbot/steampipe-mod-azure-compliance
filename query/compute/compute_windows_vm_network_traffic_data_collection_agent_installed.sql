select
  -- Required Columns
  vm.id as resource,
  case
    when os_type = 'Linux' then 'skip'
    when image_publisher = 'MicrosoftWindowsServer' and image_offer = 'WindowsServer' and image_sku = any(ARRAY
      ['2008-R2-SP1', '2008-R2-SP1-smalldisk', '2012-Datacenter', '2012-Datacenter-smalldisk', '2012-R2-Datacenter', '2012-R2-Datacenter-smalldisk','2016-Datacenter', '2016-Datacenter-Server-Core', '2016-Datacenter-Server-Core-smalldisk', '2016-Datacenter-smalldisk', '2016-Datacenter-with-Containers', '2016-Datacenter-with-RDSH', '2019-Datacenter', '2019-Datacenter-Core', '2019-Datacenter-Core-smalldisk', '2019-Datacenter-Core-with-Containers', '2019-Datacenter-Core-with-Containers-smalldisk', '2019-Datacenter-smalldisk', '2019-Datacenter-with-Containers', '2019-Datacenter-with-Containers-smalldisk', '2019-Datacenter-zhcn'])
    then 'ok'
    when image_publisher = 'MicrosoftWindowsServer' and image_offer = 'WindowsServerSemiAnnual' and image_sku = any(ARRAY [ 'Datacenter-Core-1709-smalldisk', 'Datacenter-Core-1709-with-Containers-smalldisk', 'Datacenter-Core-1803-with-Containers-smalldisk']) then 'ok'
    when image_publisher = 'MicrosoftWindowsServerHPCPack' and image_offer = 'WindowsServerHPCPack' then 'ok'
    when image_publisher = 'MicrosoftSQLServer' and image_offer like any (array ['%-WS2016', '%-WS2016-BYOL', '%-WS2012R2', '%-WS2012R2-BYOL']) then 'ok'
    when image_publisher = 'MicrosoftRServer' and image_offer = 'MLServer-WS201' then 'ok'
    when image_publisher = 'MicrosoftVisualStudio' and image_offer = any(ARRAY ['VisualStudio',  'Windows'])  then 'ok'

    when image_publisher = 'MicrosoftDynamicsAX' and image_offer = 'Dynamics' and image_sku = 'Pre-Req-AX7-Onebox-U8' then 'ok'
    when image_publisher = 'microsoft-ads' and image_offer = 'windows-data-science-vm' then 'ok'
    when image_publisher = 'MicrosoftWindowsDesktop' and image_offer = 'Windows-10'  then 'ok'
    else 'alarm'
  end as status,
  case
    when os_type = 'Linux' then vm.title || ' is ' || os_type || ' virtual machine.'
    when image_publisher = 'MicrosoftWindowsServer' and image_offer = 'WindowsServer' and image_sku = any(ARRAY
      ['2008-R2-SP1', '2008-R2-SP1-smalldisk', '2012-Datacenter', '2012-Datacenter-smalldisk', '2012-R2-Datacenter', '2012-R2-Datacenter-smalldisk','2016-Datacenter', '2016-Datacenter-Server-Core', '2016-Datacenter-Server-Core-smalldisk', '2016-Datacenter-smalldisk', '2016-Datacenter-with-Containers', '2016-Datacenter-with-RDSH', '2019-Datacenter', '2019-Datacenter-Core', '2019-Datacenter-Core-smalldisk', '2019-Datacenter-Core-with-Containers', '2019-Datacenter-Core-with-Containers-smalldisk', '2019-Datacenter-smalldisk', '2019-Datacenter-with-Containers', '2019-Datacenter-with-Containers-smalldisk', '2019-Datacenter-zhcn'])
    then vm.title || ' has network traffic data collection agent installed.'
    when image_publisher = 'MicrosoftWindowsServer' and image_offer = 'WindowsServerSemiAnnual' and image_sku = any(ARRAY [ 'Datacenter-Core-1709-smalldisk', 'Datacenter-Core-1709-with-Containers-smalldisk', 'Datacenter-Core-1803-with-Containers-smalldisk']) then 'ok'
    when image_publisher = 'MicrosoftWindowsServerHPCPack' and image_offer = 'WindowsServerHPCPack' then vm.title || ' has network traffic data collection agent installed.'
    when image_publisher = 'MicrosoftSQLServer' and image_offer like any (array ['%-WS2016', '%-WS2016-BYOL', '%-WS2012R2', '%-WS2012R2-BYOL']) then vm.title || ' has network traffic data collection agent installed.'
    when image_publisher = 'MicrosoftRServer' and image_offer = 'MLServer-WS201' then vm.title || ' has network traffic data collection agent installed.'
    when image_publisher = 'MicrosoftVisualStudio' and image_offer = any(ARRAY ['VisualStudio', 'Windows']) then vm.title || ' has network traffic data collection agent installed.'

    when image_publisher = 'MicrosoftDynamicsAX' and image_offer = 'Dynamics' and image_sku = 'Pre-Req-AX7-Onebox-U8' then vm.title || ' has network traffic data collection agent installed.'
    when image_publisher = 'microsoft-ads' and image_offer = 'Dynamics' and image_sku = 'windows-data-science-vm' then vm.title || ' has network traffic data collection agent installed.'
    when image_publisher = 'MicrosoftWindowsDesktop' and image_offer = 'Windows-10' then vm.title || ' has network traffic data collection agent installed.'
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