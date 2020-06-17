[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms");
$dsl = "ULN123";
$itefc = @('MicrosoftEdgeBackups','AppData','Musica');
$mwt = 30;
$c = 0;
while ($c -ne $mwt) {
        Start-Sleep -s 1;
        Write-Host $c;
		$ds = gwmi -Class Win32_logicaldisk | ? { $_.VolumeName -Like "*$dsl*" } | select DeviceID | % { $_.DeviceID };
		if ($ds) {
			gci $home -Recurse -Exclude $itefc | cp -Destination {Join-Path ($ds + "/" + $env:UserName + "_C/") $_.FullName.Substring($home.length)}
			$do = gwmi -Class Win32_logicaldisk | ? {  $_.DeviceID -NotLike "*C*" } | ? { $_.DeviceID -NotLike "*$ds*" } | select DeviceID | % { $_.DeviceID };
			$do | % { cp -Path $_ -Destination ($ds + "/" + $env:UserName + "_" + $_).TrimEnd(':') -Recurse }
			[System.Windows.Forms.MessageBox]::Show("Process completed","LDS",0 ,48); 
			exit;}
		$c++;
	}
