# Manage SSH host key signing
path "ssh-host-signer/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage SSH user key signing
path "ssh-client-signer/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

