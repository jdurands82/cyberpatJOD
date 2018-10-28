<#deletes bad users from computer
needs goodusers.txt from desktop in which Administrator be included#>
$admins = get-localgroupmember "ADministrators"
New-LocalGroup "script"
Get-LocalUser | Add-LocalGroupMember -group "script" | where-object{$_ -notcontains $_.NAME}
$goodusers = get-content C:\Users\joe\Desktop\goodusers.txt | foreach-object {"$env:computername\$_"}
$currentusers = get-localgroupmember -group "script"
$invalidUsers = $currentUsers | where-object{$goodUsers -notcontains $_.name}
if($invalidusers.Length -gt 0)
{
    Echo "Invalid Users found: `r`n$invalidUsers"
    $choice = read-host "Remove?"
    if($choice.tolower() -eq "y")
        {
        $invalidUsers| Remove-LocalGroupMember -group "Users"
        echo "Removed `r`n$invalidUsers"
        }
    }
    else
    {
    echo "All Valid"        
 }
 
