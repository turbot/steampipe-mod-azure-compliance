# Azure Compliance Mod for Powerpipe

200+ checks covering industry defined security best practices for Azure. Includes full support for `CIS v1.3`,`CIS v1.4`,`CIS v1.5`,`CIS v2.0`,`CIS v2.1`,`CIS v3.0`,`HIPAA HITRUST 9.2`,`NIST SP 800-53`,` NIST SP 800-171` and `PCI DSS v3.2.1` compliance benchmarks across all your Azure subscriptions.

Run checks in a dashboard:
![image](https://raw.githubusercontent.com/turbot/steampipe-mod-azure-compliance/main/docs/azure_compliance_dashboard.png)

Or in a terminal:
![image](https://raw.githubusercontent.com/turbot/steampipe-mod-azure-compliance/main/docs/azure_cis_v300_console.png)

## Documentation

- **[Benchmarks and controls →](https://hub.powerpipe.io/mods/turbot/azure_compliance/controls)**
- **[Named queries →](https://hub.powerpipe.io/mods/turbot/azure_compliance/queries)**

## Getting Started

### Installation

Install Powerpipe (https://powerpipe.io/downloads), or use Brew:

```sh
brew install turbot/tap/powerpipe
```

This mod also requires [Steampipe](https://steampipe.io) with the [Azure plugin](https://hub.steampipe.io/plugins/turbot/azure) and the [Azure Active Directory plugin](https://hub.steampipe.io/plugins/turbot/azuread) as the data source. Install Steampipe (https://steampipe.io/downloads), or use Brew:

```sh
brew install turbot/tap/steampipe
steampipe plugin install azure
steampipe plugin install azuread
```

Steampipe will automatically use your default Azure and Azure Active Directory credentials. Optionally, you can [setup multiple subscriptions](https://hub.steampipe.io/plugins/turbot/azure#multi-subscription-connections) for Azure or [customize Azure credentials](https://hub.steampipe.io/plugins/turbot/azure#configuring-azure-credentials) or you can [setup multiple tenants](https://hub.steampipe.io/plugins/turbot/azuread#multi-tenant-connections) for Azure Active Directory or [customize Azure Active Directory credentials](https://hub.steampipe.io/plugins/turbot/azuread#configuring-azure-active-directory-credentials).


Finally, install the mod:

```sh
mkdir dashboards
cd dashboards
powerpipe mod init
powerpipe mod install github.com/turbot/steampipe-mod-azure-compliance
```

### Browsing Dashboards

Start Steampipe as the data source:

```sh
steampipe service start
```

Start the dashboard server:

```sh
powerpipe server
```

Browse and view your dashboards at **http://localhost:9033**.

### Running Checks in Your Terminal

Instead of running benchmarks in a dashboard, you can also run them within your
terminal with the `powerpipe benchmark` command:

List available benchmarks:

```sh
powerpipe benchmark list
```

Run a benchmark:

```sh
powerpipe benchmark run azure_compliance.benchmark.cis_v300
```

Different output formats are also available, for more information please see
[Output Formats](https://powerpipe.io/docs/reference/cli/benchmark#output-formats).

### Common and Tag Dimensions

The benchmark queries use common properties (like `connection_name`, `resource_group`, `region`, `subscription` and `subscription_id`) and tags that are defined in the form of a default list of strings in the `variables.sp` file. These properties can be overwritten in several ways:

It's easiest to setup your vars file, starting with the sample:

```sh
cp powerpipe.ppvars.example powerpipe.ppvars
vi powerpipe.ppvars
```

Alternatively you can pass variables on the command line:

```sh
powerpipe benchmark run azure_compliance.benchmark.cis_v300 --var 'tag_dimensions=["Environment", "Owner"]'
```

Or through environment variables:

```sh
export PP_VAR_common_dimensions='["subscription_id", "connection_name", "resource_group"]'
export PP_VAR_tag_dimensions='["Environment", "Owner"]'
powerpipe benchmark run azure_compliance.benchmark.cis_v300
```

## Open Source & Contributing

This repository is published under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0). Please see our [code of conduct](https://github.com/turbot/.github/blob/main/CODE_OF_CONDUCT.md). We look forward to collaborating with you!

[Steampipe](https://steampipe.io) and [Powerpipe](https://powerpipe.io) are products produced from this open source software, exclusively by [Turbot HQ, Inc](https://turbot.com). They are distributed under our commercial terms. Others are allowed to make their own distribution of the software, but cannot use any of the Turbot trademarks, cloud services, etc. You can learn more in our [Open Source FAQ](https://turbot.com/open-source).

## Get Involved

**[Join #powerpipe on Slack →](https://turbot.com/community/join)**

Want to help but don't know where to start? Pick up one of the `help wanted` issues:

- [Powerpipe](https://github.com/turbot/powerpipe/labels/help%20wanted)
- [Azure Compliance Mod](https://github.com/turbot/steampipe-mod-azure-compliance/labels/help%20wanted)
