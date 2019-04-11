# Terraform Goldfish

A Terraform module to run the Vault UI [Goldfish](https://vault-ui.io/).



```hcl
module "goldfish" {
  # remember to use `terraform get` to fetch the module
  source = "git@github.com/ehime:terraform-goldfish?ref=v1.0.0"

  # deployment config variables
  wrapping_token   = "See wiki for how to generate this"
  goldfish_version = "v0.8.0"

  listener = {
    address          = ":443"
    tls_cert_file    = ""
    tls_key_file     = ""
    tls_disable      = "0"
    tls_autoredirect = "0"
  }

  vault = {
    address         = "https://vault.{your_host}:8200"
    tls_skip_verify = "0"
    runtime_config  = "secret/goldfish"
    approle_login   = "auth/approle/login"
    approle_id      = "goldfish"
  }
}
```

See [example](example) for a complete example ....

## Fineprint

This terraform module will NOT work out of the box (for obvious reasons). You (the operator) will need to comb through each variable and possibly change the value.

In particular, Goldfish's certificates are not handled in this module. You may want to add steps to fetch those certificates in `user_data.sh` or provision them.

It is highly recommended to add steps in `user_data.sh` to disable swap and ssh for security reasons, as Goldfish may contain sensitive data in memory for brief moments in transit.

## Goldfish Wiki
- [Home](https://github.com/Caiyeon/goldfish/wiki)
- [Configuration](https://github.com/Caiyeon/goldfish/wiki/Configuration)
- [FAQ](https://github.com/Caiyeon/goldfish/wiki/FAQ)
- [Features](https://github.com/Caiyeon/goldfish/wiki/Features)
- [Production Deployment](https://github.com/Caiyeon/goldfish/wiki/Production-Deployment)

## Documentation generation

Documentation should be modified within `main.tf` and generated using [terraform-docs](https://github.com/segmentio/terraform-docs):

```bash
terraform-docs md ./ |sed '$d' >| README.md
```

## License

GPL 3.0 Licensed. See [LICENSE](https://github.com/ehime/terraform-securitymonkey/tree/master/LICENSE) for full details.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| goldfish_version | Version of goldfish to deploy | string | `v0.8.0` | no |
| listener | Configuration for goldfish listener. See github.com/caiyeon/goldfish/config for more | map | `<map>` | no |
| vault | Configuration for goldfish connection to vault. See github.com/caiyeon/goldfish/config for more | map | `<map>` | no |
| wrapping_token | A wrapped approle secret_id for goldfish to bootstrap to vault | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| goldfish_public_ip | The public IP address used to access the Vault UI |
