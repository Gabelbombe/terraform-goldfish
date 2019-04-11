#!/bin/bash
readonly VAULT_TLS_CERT_FILE="/opt/vault/tls/vault.crt.pem"
readonly VAULT_TLS_KEY_FILE="/opt/vault/tls/vault.key.pem"

/opt/vault/bin/run-vault                  \
  --tls-cert-file "$VAULT_TLS_CERT_FILE"  \
  --tls-key-file "$VAULT_TLS_KEY_FILE"
