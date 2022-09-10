#Get Current User Path & Set Save Path
$User = [Environment]::GetFolderPath(40)
$Save = $User + '\' + $env:UserName + '(' + (Get-Date -UFormat "%d%b%Y") + ')'

#Copy Common User Folders to Save Folder
robocopy /s /r:1 /w:1 $User'\3D Objects' $Save'\3D Objects'
robocopy /s /r:1 /w:1 $User'\AppData\Roaming' $Save'\AppData\Roaming'
robocopy /s /r:1 /w:1 $User'\Contacts' $Save'\Contacts'
robocopy /s /r:1 /w:1 $User'\Desktop' $Save'\Desktop'
robocopy /s /r:1 /w:1 $User'\Documents' $Save'\Documents'
robocopy /s /r:1 /w:1 $User'\Downloads' $Save'\Downloads'
robocopy /s /r:1 /w:1 $User'\Favorites' $Save'\Favorites'
robocopy /s /r:1 /w:1 $User'\Links' $Save'\Links'
robocopy /s /r:1 /w:1 $User'\Music' $Save'\Music'
robocopy /s /r:1 /w:1 $User'\Pictures' $Save'\Pictures'
robocopy /s /r:1 /w:1 $User'\Saved Games' $Save'\Saved Games'
robocopy /s /r:1 /w:1 $User'\Videos' $Save'\Videos'

#Compress The Save Folder Into A ZIP (Max 2GB)
Compress-Archive -Update -Path $Save'\*' -DestinationPath $Save

#Delete The 'Uncompressed' Save Folder
Remove-Item -Force -Recurse $Save
