# ================= CONFIG =================
$SourceSubscriptionId = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
$TargetSubscriptionId = "yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy"

$SourceKeyVaultName = "source-keyvault-name"
$TargetKeyVaultName = "target-keyvault-name"
# =========================================

Write-Host "Setting SOURCE subscription..."
Set-AzContext -SubscriptionId $SourceSubscriptionId | Out-Null

Write-Host "Fetching secrets from $SourceKeyVaultName..."
$exportedSecrets = @()

$secrets = Get-AzKeyVaultSecret -VaultName $SourceKeyVaultName

foreach ($secret in $secrets) {

    if ($secret.Enabled -ne $true) {
        Write-Host "⏭ Skipping disabled secret: $($secret.Name)"
        continue
    }

    Write-Host "Exporting secret: $($secret.Name)"

    $secretValue = (Get-AzKeyVaultSecret `
        -VaultName $SourceKeyVaultName `
        -Name $secret.Name).SecretValue

    $exportedSecrets += [PSCustomObject]@{
        Name  = $secret.Name
        Value = $secretValue
    }
}

Write-Host "Exported $($exportedSecrets.Count) secrets."

# ---------------- TARGET ------------------
Write-Host "Switching to TARGET subscription..."
Set-AzContext -SubscriptionId $TargetSubscriptionId | Out-Null

Write-Host "Importing secrets into $TargetKeyVaultName..."

foreach ($secret in $exportedSecrets) {

    Write-Host "Importing secret: $($secret.Name)"

    Set-AzKeyVaultSecret `
        -VaultName $TargetKeyVaultName `
        -Name $secret.Name `
        -SecretValue $secret.Value | Out-Null
}

Write-Host "All secrets copied successfully!"