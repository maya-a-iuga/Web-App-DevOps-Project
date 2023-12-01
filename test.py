from azure.identity import ManagedIdentityCredential
from azure.keyvault.secrets import SecretClient

key_vault_url = "https://key-vault-jason.vault.azure.net/"

# Set up Azure Key Vault client with Managed Identity
credential = ManagedIdentityCredential()
secret_client = SecretClient(vault_url=key_vault_url, credential=credential)

server = secret_client.get_secret("app-server-name").value

print(server)