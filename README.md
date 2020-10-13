## Additional Requirements

### PowerShell Dependencies

As this module uses PowerShell it requires that PowerShell Core and the following modules are installed on the deployment agent:

- PowerShell Core (~>7.0)
- PS Module: `AzureHelpers` (~>0.2.1)
- Please also install any dependencies of `AzureHelpers`

```powershell
Install-Module "AzureHelpers"
```

## Usage Example

```terraform
provider "shell" {
  environment = {
    AzureClientId     = var.client_id
    AzureTenantId     = var.tenant_id
    AzureSubscription = var.subscription_id
  }

  sensitive_environment = {
    AzureClientSecret = var.client_secret
  }

  interpreter = ["pwsh", "-command"]
}

module "webapp_data" {
  source            = "AdamCoulterOz/webappdata/azurerm"
  web_app_id        = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/myrg/providers/Microsoft.Web/sites/mywebapp"
}
```
