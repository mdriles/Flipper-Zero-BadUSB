# Save as: DiscordWebhookTest.ps1
$webhook = 'https://discord.com/api/webhooks/1346196362076622920/NS5h5Ahbw3EnJSqFy0MjRyrRzyGIgBOzR1WDSGrSL8vVYn51kXd98E7tWrJcd7NnbkyH'

function Send-Discord([string]$msg) {
  $body = @{ content = $msg } | ConvertTo-Json -Compress
  try {
    Invoke-RestMethod -Uri $webhook -Method Post -ContentType 'application/json' -Body $body
    Write-Host "OK -> $msg"
  } catch {
    Write-Warning "Failed -> $msg : $($_.Exception.Message)"
  }
}

Send-Discord "Flipper test #1 $(Get-Date -Format s)"
Start-Sleep -Seconds 10
Send-Discord "Flipper test #2 $(Get-Date -Format s)"
Start-Sleep -Seconds 10
Send-Discord "Flipper test #3 $(Get-Date -Format s)"
