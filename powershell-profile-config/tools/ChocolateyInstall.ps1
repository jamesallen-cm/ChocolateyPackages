try {
    $templateFile = (Join-Path $(Split-Path -parent $MyInvocation.MyCommand.Definition) 'profile_template.txt')

    $psProfile = "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
    Write-Host "Creating power shell profile in at " $psProfile
    (Get-Content $templateFile -Raw) | out-file -encoding Default -filepath $psProfile
    Write-Host "PowerShell Profile Creation Complete"

    Write-ChocolateySuccess 'powershell-profile-config'
} catch {
  Write-ChocolateyFailure 'powershell-profile-config' $($_.Exception.Message)
  throw
}
