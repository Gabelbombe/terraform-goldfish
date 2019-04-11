# see the github wiki for how to generate this token
variable "wrapping_token" {
  type        = "string"
  description = "A wrapped approle secret_id for goldfish to bootstrap to vault"
}

variable "goldfish_version" {
  type        = "string"
  description = "Version of goldfish to deploy"
  default     = "v0.8.0"
}

# configure how goldfish will listen to requests
variable "listener" {
  type        = "map"
  description = "Configuration for goldfish listener. See [Wiki Configuration] for more"

  # this default will NOT launch. It only serves as a template
  default = {
    address          = ":443"
    tls_cert_file    = ""
    tls_key_file     = ""
    tls_disable      = "0"
    tls_autoredirect = "0"
  }
}

# configure how goldfish will connect to vault
variable "vault" {
  type        = "map"
  description = "Configuration for goldfish connection to vault. See [Wiki Configuration] for more"

  # this default will NOT launch. It only serves as a template
  default = {
    address         = "https://vault.hostname:8200"
    tls_skip_verify = "0"
    runtime_config  = "secret/goldfish"
    approle_login   = "auth/approle/login"
    approle_id      = "goldfish"
  }
}
