#Install-Module -Name Microsoft.Graph -Scope CurrentUser
Connect-MgGraph -scopes "user.readwrite.all, group.readwrite.all"
$PWProfile = @{
      Password = "Pa55w.rd";
        ForceChangePasswordNextSignIn = $false
        }

New-MgUser `
    -DisplayName "Chris McGhee" `
    -GivenName "Chris" -Surname "McGhee" `
    -MailNickname "cmcghee" `
    -UsageLocation "US" `
    -UserPrincipalName "cmcghee@M365x46482142.onmicrosoft.com" `
    -PasswordProfile $PWProfile -AccountEnabled `
    -Department "IT" -JobTitle "IT Administrator"