<#Deletes bad services from bad.txt on the desktop CHANGE FILEPATH #>
$bad = @(
    get-content C:\users\PCDC\Desktop\bad.txt
)
Get-WindowsOptionalFeature -online | where-object{$bad -contains $_.featurename} 
