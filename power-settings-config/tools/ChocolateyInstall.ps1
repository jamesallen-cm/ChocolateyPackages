try {
  if(!(test-path HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\94ac6d29-73ce-41a6-809f-6363ba21b47e))
  {
    Write-Host "Disabling Hybrid Sleep mode"
    if(!(test-path HKLM:\SOFTWARE\Policies\Microsoft\Power))
      {
        New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Power
      }
    if(!(test-path HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings))
      {
          New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings
      }

    New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\94ac6d29-73ce-41a6-809f-6363ba21b47e
    New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\94ac6d29-73ce-41a6-809f-6363ba21b47e -Name ACSettingIndex -PropertyType DWord -Value 0
    New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\94ac6d29-73ce-41a6-809f-6363ba21b47e -Name DCSettingIndex -PropertyType DWord -Value 1

  }
  else
  {
      Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\94ac6d29-73ce-41a6-809f-6363ba21b47e -Name ACSettingIndex -Value 0
      Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\94ac6d29-73ce-41a6-809f-6363ba21b47e -Name DCSettingIndex -Value 1
  }

  if(!(test-path HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab))
  {
    Write-Host "Disabling standby mode"
    if(!(test-path HKLM:\SOFTWARE\Policies\Microsoft\Power))
      {
        New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Power
      }
    if(!(test-path HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings))
      {
          New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings
      }

    New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab
    New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab -Name ACSettingIndex -PropertyType DWord -Value 0
    New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab -Name DCSettingIndex -PropertyType DWord -Value 1

  }
  else
  {
      Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab -Name ACSettingIndex -Value 0
      Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab -Name DCSettingIndex -Value 1
  }

  #disable hibernation
  Write-Host "Disabling hibernation mode"
  powercfg -h off

    Write-ChocolateySuccess 'power-settings-config'
} catch {
  Write-ChocolateyFailure 'power-settings-config' $($_.Exception.Message)
  throw
}
