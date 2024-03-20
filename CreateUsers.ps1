#Install-Module -Name Microsoft.Graph -Scope CurrentUser
Connect-MgGraph -scopes "user.readwrite.all, group.readwrite.all"
$PWProfile = @{
      Password = "Pa55w.rd";
        ForceChangePasswordNextSignIn = $false
        }

New-MgUser `
    -DisplayName "Ebone Burns" `
    -GivenName "Ebone" -Surname "Burns" `
    -MailNickname "eburns" `
    -UsageLocation "US" `
    -UserPrincipalName "eburns@M365x46482142.onmicrosoft.com" `
    -PasswordProfile $PWProfile -AccountEnabled `
    -Department "IT" -JobTitle "IT Administrator"

    Get-mguser | Where-Object -FilterScript{$_.DisplayName -eq "Ebone Burns"}