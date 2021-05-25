## Description

Disable `SSH` access on network security groups from the Internet.

The potential security problem with using `SSH` over the Internet is that attackers can use various brute force techniques to gain access to Azure Virtual Machines. Once the attackers gain access, they can use a virtual machine as a launch point for compromising other machines on the Azure Virtual Network or even attack networked devices outside of Azure.

## Remediation

Disable direct `SSH` access to your Azure Virtual Machines from the Internet. After direct `SSH` access from the Internet is disabled, you have other options you can use to access these virtual machines for remote management:

1. [Point-to-site VPN](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-howto-point-to-site-resource-manager-portal)
1. [Site-to-site VPN](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-howto-site-to-site-resource-manager-portal)
1. [ExpressRoute](https://docs.microsoft.com/en-us/azure/expressroute/)

**Note:** By default, `SSH` access from internet is not enabled.
