## Description

Disable Internet exposed UDP ports on network security groups.

The potential security problem with broadly exposing UDP services over the Internet is that attackers can use DDoS amplification techniques to reflect spoofed UDP traffic from Azure Virtual Machines. The most common types of these attacks use exposed DNS, NTP, SSDP, SNMP, CLDAP and other UDP-based services as amplification source for disrupting services of other machines on the Azure Virtual Network or even attack networked devices outside of Azure.

**Note:** Opting-out of Network Watcher automatic enablement is a permanent change. Once you opt-out you cannot opt-in without contacting support.

## Remediation

Disable direct UDP access to your Azure Virtual Machines from the Internet. After direct UDP access from the Internet is disabled, you have other options you can use to access UDP based services running on these virtual machines:

1. [Point-to-site VPN](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-howto-point-to-site-resource-manager-portal)
1. [Site-to-site VPN](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-howto-site-to-site-resource-manager-portal)
1. [ExpressRoute](https://docs.microsoft.com/en-us/azure/expressroute/)

**Note:** By default, UDP access from internet is not enabled.
