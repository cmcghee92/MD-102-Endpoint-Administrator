#Install-Module Microsoft.Graph -Scope CurrentUser
Connect-MgGraph -Scopes "User.ReadWrite.All" 

[string]$location = "United States"
[string]$phone = (Read-host -prompt "Please enter phone number")

Get-MgUser | ForEach-Object { Update-MgUser -UserId $_.Id -UsageLocation "$Location" }

Get-MgUser | ForEach-Object { Update-MgUser -UserId $_.Id -TelephoneNumber "$phone" }
