Install-Module AzureHelpers -MinimumVersion 0.2.1 -Force
Import-Module AzureHelpers | Write-Information
$token = Get-AzToken -AuthMethod ClientSecret
$secure_token = ConvertTo-SecureString $token -AsPlainText -Force
$queryParameters = @{ 'api-version' = '2019-08-01' }
$URL = "https://management.azure.com/$env:AzWebAppId"
$result = Invoke-RestMethod -Method "GET" -Uri $URL -Authentication Bearer -Token $secure_token -Body $queryParameters
$output = @{
    customDomainVerificationId = $result.properties.customDomainVerificationId
}
$outputJson = ConvertTo-Json -InputObject $output -Depth 3
Write-Output $outputJson
