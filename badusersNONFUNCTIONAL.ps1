<#deletes bad users from computer
needs goodusers.txt from desktop in which Administrator be included#>
$goodusers = get-content C:\Users\PCDC\Desktop\goodusers.txt | foreach-object {"$env:computername\$_"}
$currentusers = get-localgroupmember -group "Users"
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
