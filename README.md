
# Azure Compliance Scanning Tool

200+ checks covering industry defined security best practices for Azure. Includes full support for `CIS v1.3` and `HIPAA HITRUST 9.2` compliance benchmarks across all your Azure subscriptions.

**Includes full support for the CIS v1.3 Azure Benchmarks**:

![image](https://raw.githubusercontent.com/turbot/steampipe-mod-azure-compliance/main/docs/azure_cis_v130_console.png)

Includes support for:
* [Azure CIS v1.3.0](https://hub.steampipe.io/mods/turbot/azure_compliance/controls/benchmark.cis_v130)
* [HIPAA HITRUST 9.2](https://hub.steampipe.io/mods/turbot/azure_compliance/controls/benchmark.hipaa_hitrust_v92)

## Quick start

1) Download and install Steampipe (https://steampipe.io/downloads).

2) Install the Azure plugin with [Steampipe](https://steampipe.io):
```sh
steampipe plugin install azure
```

3) Configure your Azure CLI credentials
```sh
az login
```

4) Clone this repo:
```sh
git clone https://github.com/turbot/steampipe-mod-azure-compliance.git
cd steampipe-mod-azure-compliance
```

5) Run all the benchmarks:
```shell
steampipe check all
```
### Other stuff to try out

Run an individual benchmark:
```shell
steampipe check benchmark.cis_v130_6
```

View all controls in this mod:
```sh
steampipe query "select resource_name from steampipe_control;"
```

Run a specific control:
```shell
steampipe check control.cis_v130_4_3_5
```

## Contributing

If you have an idea for additional compliance controls, or just want to help maintain and extend this mod ([or others](https://github.com/topics/steampipe-mod)) we would love you to join the community and start contributing. (Even if you just want to help with the docs.)

- **[Join our Slack community →](https://join.slack.com/t/steampipe/shared_invite/zt-oij778tv-lYyRTWOTMQYBVAbtPSWs3g)**
- **[Mod developer guide →](https://steampipe.io/docs/using-steampipe/writing-controls)**

Please see the [contribution guidelines](https://github.com/turbot/steampipe/blob/main/CONTRIBUTING.md) and our [code of conduct](https://github.com/turbot/steampipe/blob/main/CODE_OF_CONDUCT.md). All contributions are subject to the [Apache 2.0 open source license](https://github.com/turbot/steampipe-mod-aws-compliance/blob/main/LICENSE).

`help wanted` issues:
- [Steampipe](https://github.com/turbot/steampipe/labels/help%20wanted)
- [Azure Mod](https://github.com/turbot/steampipe-mod-azure-compliance/labels/help%20wanted)