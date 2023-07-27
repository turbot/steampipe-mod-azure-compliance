# Azure Compliance Mod for Steampipe

200+ checks covering industry defined security best practices for Azure. Includes full support for `CIS v1.3`,`CIS v1.4`,`CIS v1.5`,`CIS v2.0`,`HIPAA HITRUST 9.2`,`NIST SP 800-53` and `PCI DSS v3.2.1` compliance benchmarks across all your Azure subscriptions.

**Includes full support for the CIS v1.3 Azure Benchmarks**.

Run checks in a dashboard:
![image](https://raw.githubusercontent.com/turbot/steampipe-mod-azure-compliance/main/docs/azure_compliance_dashboard.png)

Or in a terminal:
![image](https://raw.githubusercontent.com/turbot/steampipe-mod-azure-compliance/main/docs/azure_cis_v130_console.png)

Includes support for:
* [Azure CIS v1.3.0](https://hub.steampipe.io/mods/turbot/azure_compliance/controls/benchmark.cis_v130)
* [Azure CIS v1.4.0](https://hub.steampipe.io/mods/turbot/azure_compliance/controls/benchmark.cis_v140)
* [Azure CIS v1.5.0](https://hub.steampipe.io/mods/turbot/azure_compliance/controls/benchmark.cis_v150)
* [Azure CIS v2.0.0](https://hub.steampipe.io/mods/turbot/azure_compliance/controls/benchmark.cis_v200)
* [HIPAA HITRUST 9.2](https://hub.steampipe.io/mods/turbot/azure_compliance/controls/benchmark.hipaa_hitrust_v92)
* [NIST SP 800-53 Revision 5](https://hub.steampipe.io/mods/turbot/azure_compliance/controls/benchmark.nist_sp_800_53_rev_5)
* [Other Compliance Checks](https://hub.steampipe.io/mods/turbot/azure_compliance/controls/benchmark.other) 🚀 New!
* [PCI DSS v3.2.1](https://hub.steampipe.io/mods/turbot/azure_compliance/controls/benchmark.pci_dss_v321)

## Getting started

### Installation

Download and install Steampipe (https://steampipe.io/downloads). Or use Brew:

```sh
brew tap turbot/tap
brew install steampipe
```

Install the Azure and the Azure Active Directory plugins with [Steampipe](https://steampipe.io):
```sh
steampipe plugin install azure
steampipe plugin install azuread
```

Configure your Azure CLI credentials
```sh
az login
```

Clone:

```sh
git clone https://github.com/turbot/steampipe-mod-azure-compliance.git
cd steampipe-mod-azure-compliance
```

### Usage

Start your dashboard server to get started:

```sh
steampipe dashboard
```

By default, the dashboard interface will then be launched in a new browser
window at http://localhost:9194. From here, you can run benchmarks by
selecting one or searching for a specific one.

Instead of running benchmarks in a dashboard, you can also run them within your
terminal with the `steampipe check` command:

Run all benchmarks:

```sh
steampipe check all
```

Run a single benchmark:

```sh
steampipe check benchmark.cis_v130_6
```

Run a specific control:

```sh
steampipe check control.cis_v130_4_3_5
```

Different output formats are also available, for more information please see
[Output Formats](https://steampipe.io/docs/reference/cli/check#output-formats).


### Credentials

This mod uses the credentials configured in the [Steampipe Azure plugin](https://hub.steampipe.io/plugins/turbot/azure).

### Configuration

No extra configuration is required.

### Common and Tag Dimensions

The benchmark queries use common properties (like `connection_name`, `resource_group`, `region`, `subscription` and `subscription_id`) and tags that are defined in the form of a default list of strings in the `mod.sp` file. These properties can be overwritten in several ways:

- Copy and rename the `steampipe.spvars.example` file to `steampipe.spvars`, and then modify the variable values inside that file
- Pass in a value on the command line:

  ```shell
  steampipe check benchmark.cis_v140 --var 'common_dimensions=["resource_group", "region", "subscription", "subscription_id"]'
  ```

  ```shell
  steampipe check benchmark.cis_v140 --var 'tag_dimensions=["Department", "Environment"]'
  ```

- Set an environment variable:

  ```shell
  SP_VAR_common_dimensions='["resource_group", "region", "subscription", "subscription_id"]' steampipe check control.storage_account_use_virtual_service_endpoint
  ```

  ```shell
  SP_VAR_tag_dimensions='["Department", "Environment"]' steampipe check control.storage_account_use_virtual_service_endpoint
  ```

## Contributing

If you have an idea for additional compliance controls, or just want to help maintain and extend this mod ([or others](https://github.com/topics/steampipe-mod)) we would love you to join the community and start contributing. (Even if you just want to help with the docs.)

- **[Join #steampipe on Slack →](https://turbot.com/community/join)** and hang out with other Mod developers.

Please see the [contribution guidelines](https://github.com/turbot/steampipe/blob/main/CONTRIBUTING.md) and our [code of conduct](https://github.com/turbot/steampipe/blob/main/CODE_OF_CONDUCT.md). All contributions are subject to the [Apache 2.0 open source license](https://github.com/turbot/steampipe-mod-azure-compliance/blob/main/LICENSE).

Want to help but not sure where to start? Pick up one of the `help wanted` issues:

- [Steampipe](https://github.com/turbot/steampipe/labels/help%20wanted)
- [Azure Compliance Mod](https://github.com/turbot/steampipe-mod-azure-compliance/labels/help%20wanted)
