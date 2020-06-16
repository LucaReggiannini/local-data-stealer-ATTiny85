[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms");
$dsl = "External";
$itefc = @('MicrosoftEdgeBackups','AppData','Musica');
$ds = gwmi -Class Win32_logicaldisk | ? { $_.VolumeName -Like "*$dsl*" } | select DeviceID | % { $_.DeviceID };
gci $home -Recurse -Exclude $itefc | cp -Destination {Join-Path ($ds + "/" + $env:UserName + "_C/") $_.FullName.Substring($home.length)}
$do = gwmi -Class Win32_logicaldisk | ? {  $_.DeviceID -NotLike "*C*" } | ? { $_.DeviceID -NotLike "*$ds*" } | select DeviceID | % { $_.DeviceID };
$do | % { cp -Path $_ -Destination ($ds + "/" + $env:UserName + "_" + $_).TrimEnd(':') -Recurse }
[System.Windows.Forms.MessageBox]::Show("Process completed","LDS",0 ,48); 
