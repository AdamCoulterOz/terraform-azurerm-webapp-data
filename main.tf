data "shell_script" "WebApp" {
  lifecycle_commands {
    read = ". ${path.module}/Read-WebApp.ps1"
  }
  environment = {
    AzWebAppId = var.web_app_id
  }
}

output "custom_domain_verification_id" {
  value = data.shell_script.WebApp.output.customDomainVerificationId
}