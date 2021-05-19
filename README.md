# Azure Compliance Mod for Steampipe

Use SQL to run benchmarks, controls, and queries with the [Steampipe Azure plugin](https://hub.steampipe.io/plugins/turbot/azure).

* **[Get started →](https://hub.steampipe.io/mods/turbot/azure-compliance)**
* Documentation: [Controls](https://hub.steampipe.io/mods/turbot/azure-compliance/controls)
* Community: [Slack Channel](https://join.slack.com/t/steampipe/shared_invite/zt-oij778tv-lYyRTWOTMQYBVAbtPSWs3g)
* Get involved: [Issues](https://github.com/turbot/steampipe-mod-azure-compliance/issues)

## Quick start

Install the Azure plugin with [Steampipe](https://steampipe.io):
```shell
steampipe plugin install azure
```

Clone:
```sh
git clone git@github.com:turbot/steampipe-mod-azure-compliance
cd steampipe-mod-azure-compliance
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

Prerequisites:
- [Steampipe](https://steampipe.io/downloads)
- Steampipe Azure plugin installed (see above)

Clone:

```sh
git clone git@github.com:turbot/steampipe-mod-azure-compliance
cd steampipe-mod-azure-compliance
```

View controls:
```
steampipe query
> select resource_name from steampipe_control;
```

Try it!
```shell
steampipe check control.cis_v130_4_3_5
```

## Contributing

Please see the [contribution guidelines](https://github.com/turbot/steampipe/blob/main/CONTRIBUTING.md) and our [code of conduct](https://github.com/turbot/steampipe/blob/main/CODE_OF_CONDUCT.md). All contributions are subject to the [MPL-2.0 open source license](https://github.com/turbot/steampipe-mod-azure-compliance/blob/main/LICENSE).

`help wanted` issues:
- [Steampipe](https://github.com/turbot/steampipe/labels/help%20wanted)
- [Azure Mod](https://github.com/turbot/steampipe-mod-azure-compliance/labels/help%20wanted)
