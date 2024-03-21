#Install-Module Microsoft.Graph -Scope CurrentUser
Connect-MgGraph -scopes "user.readwrite.all, group.readwrite.all"

[string]$location = "US"
[string]$phone = (Read-host -prompt "Please enter phone number")

Get-MgUser | ForEach-Object { Update-MgUser -UserId $_.Id -UsageLocation "$Location" }

Get-MgUser | ForEach-Object { Update-MgUser -UserId $_.Id -MobilePhone "$phone" }


Connect-MgGraph -scopes "user.read.all, user.readwrite.all, group.readwrite.all"
[array]$CurrentPermissions = (Get-MgContext).Scopes
[array]$RequiredPermissions = "User.Read.All"
ForEach ($Permission in $RequiredPermissions) {
    If ($Permission -notin $CurrentPermissions) {
        Write-Host ("This script needs the {0} permission to run. Please have an administrator consent to the permission and try again" -f $Permission) 
        Break
    }
}