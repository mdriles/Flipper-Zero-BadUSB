# Save as: DiscordWebhookTest.ps1
$webhook = 'https://discord.com/api/webhooks/1453179264970264628/wW543T9SdRiJZr40kVppTW4beXY_6hf1e7rXbijYI0SOS8sqxxYbiAYg_A9vX7zrqkBD'

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
