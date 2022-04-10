cls

Write-Host "IIS Configuration for FAB Payment Terminal @ AxisPro ERP"
Write-Host "Developed By : Bipin @ Direct Axis Technology L.L.C  `r`n"
Write-Host "*************************************************  `r`n"

$NEW_BINDING_PORT = Read-Host -Prompt 'In which PORT you want to configure new bindings? '

if (Get-Module -ListAvailable -Name IISAdministration)
{
    Write-Host "IISAdministration Module exists"
}
else
{
    Write-Host "IISAdministration Module does not exist. So installing it."
    Install-Module -Name IISAdministration
}

$MY_WEBSITE_NAME = "Default Web Site"
try
{
    $BindingExists = $False
    foreach ($website in Get-Website)
    {
        $bindings = Get-WebBinding -Name $website.name
        foreach ($binding in $website.bindings.Collection)
        {
            $bindingInfo = $binding.bindingInformation
            if ($bindingInfo -imatch $NEW_BINDING_PORT)
            {
                "Binding: {0}" -f $bindingInfo
                Write-Host "Given PORT $NEW_BINDING_PORT is already configured with $( $MY_WEBSITE_NAME )"
                $BindingExists = $True
            }
        }
    }

    "BindingExists: {0}" -f $BindingExists
    if ($BindingExists -eq $False)
    {
        New-WebBinding -Name "*" -IPAddress "*" -Port $NEW_BINDING_PORT
    }

    $appcmd = "$env:windir\system32\inetsrv\appcmd.exe set apppool /apppool.name:DefaultAppPool /enable32BitAppOnWin64:true"
    Invoke-Expression $appcmd

}
catch
{
    Write-Host "An error occurred while configuring new binding:"
    Write-Host $_.ScriptStackTrace
}

Write-Host "IIS is configured with the PORT '$NEW_BINDING_PORT' "
Stop-IISSite -Name $( $MY_WEBSITE_NAME ) -Confirm:$False
Start-IISSite -Name $( $MY_WEBSITE_NAME )

Read-Host "Script Execution Completed - press [ENTER] to exit"
 