Connect-MgGraph -scopes "user.readwrite.all, group.readwrite.all"
New-MgGroup -DisplayName "Contoso_Sales" -Description "Contoso Sales team users" -MailEnabled:$false -Mailnickname "Contoso_Sales" -SecurityEnabled
Get-MgGroup
$group = Get-MgGroup | Where-Object {$_.DisplayName -eq "Contoso_Sales"}
$user = Get-MgUser | Where-Object {$_.DisplayName -eq "Cody Godinez"}
New-MgGroupMember -GroupId $group.Id -DirectoryObjectId $user.Id
Get-MgGroupMember -GroupId $group.Id | Format-List
