![image](https://hub.steampipe.io/images/mods/turbot/azure-compliance-social-graphic.png)

# Azure Compliance Mod for Steampipe

Run individual configuration, compliance and security controls
or full compliance benchmarks for CIS and PCI across all your Azure subscriptions.

* **[Get started →](https://hub.steampipe.io/mods/turbot/azure_compliance)**
* Documentation: [Controls](https://hub.steampipe.io/mods/turbot/azure_compliance/controls)
* Community: [Slack Channel](https://join.slack.com/t/steampipe/shared_invite/zt-oij778tv-lYyRTWOTMQYBVAbtPSWs3g)
* Get involved: [Issues](https://github.com/turbot/steampipe-mod-azure-compliance/issues)

## Quick start

Install the Azure plugin with [Steampipe](https://steampipe.io):
```shell
steampipe plugin install azure
```

Clone:
```sh
git clone https://github.com/turbot/steampipe-mod-azure-compliance.git
cd steampipe-mod-azure-compliance
```

Run all benchmarks:
```shell
steampipe check all
```

Run a benchmark:
```shell
steampipe check benchmark.cis_v130
```

Run a specific control:
```shell
steampipe check control.cis_v130_4_3_5
```

## Developing

Have an idea but aren't sure how to get started?
- **[Join our Slack community →](https://join.slack.com/t/steampipe/shared_invite/zt-oij778tv-lYyRTWOTMQYBVAbtPSWs3g)**
- **[Mod developer guide →](https://steampipe.io/docs/steampipe-mods/writing-mods.md)**

**Prerequisites**:
- [Steampipe installed](https://steampipe.io/downloads)
- Steampipe AWS plugin installed (see above)

**Fork**:
Click on the GitHub Fork Widget. (Don't forget to :star: the repo!)

**Clone**:

1. Change the current working directory to the location where you want to put the cloned directory on your local filesystem.
2. Type the clone command below inserting your GitHub username instead of `YOUR-USERNAME`:

```sh
git clone git@github.com:YOUR-USERNAME/steampipe-mod-azure-compliance
cd steampipe-mod-azure-compliance
```

**View controls and benchmarks**:
```
steampipe query "select resource_name from steampipe_control;"
```

```sql
steampipe query
> select
    resource_name
  from
    steampipe_benchmark
  order by
    resource_name;
```

## Contributing

Please see the [contribution guidelines](https://github.com/turbot/steampipe/blob/main/CONTRIBUTING.md) and our [code of conduct](https://github.com/turbot/steampipe/blob/main/CODE_OF_CONDUCT.md). All contributions are subject to the [Apache 2.0 open source license](https://github.com/turbot/steampipe-mod-azure-compliance/blob/main/LICENSE).

`help wanted` issues:
- [Steampipe](https://github.com/turbot/steampipe/labels/help%20wanted)
- [Azure Mod](https://github.com/turbot/steampipe-mod-azure-compliance/labels/help%20wanted)
