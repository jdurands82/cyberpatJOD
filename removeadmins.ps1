<#deletes bad admins from group
needs goodadmins.txt from desktop in which Administrator be included#>
$goodAdmins = get-content C:\Users\PCDC\Desktop\goodadmins.txt | foreach-object {"$env:computername\$_"}
Echo "Found GoodAdmins"
$currentAdmins = get-localgroupmember -group "Administrators"
Echo "Found current Admins"
$invalidAdmins = $currentAdmins | where-object{$goodAdmins -notcontains $_.name}
if($invalidAdmins.Length -gt 0)
{
    Echo "Invalid admins found: `r`n$invalidadmins"
    $choice = read-host "Remove?"
    if($choice.tolower() -eq "y")
        {
        $invalidAdmins| Remove-LocalGroupMember -group "Administrators"
        echo "Removed `r`n$invalidAdmins"
        }
    }
    else
    {
    echo "All Valid"
 }


