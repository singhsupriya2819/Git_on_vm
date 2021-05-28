$gitExePath = "C:\Program Files\Git\bin\git.exe"

 foreach ($asset in (Invoke-RestMethod https://api.github.com/repos/git-for-windows/git/releases/latest).assets)
 {
         $dlurl = $asset.browser_download_url
         $newver = $asset.name
         }
 try
 {
    $ProgressPreference = 'SilentlyContinue'
    if (!(Test-Path $gitExePath))
    {
       Write-Host "`nDownloading latest stable git..." -ForegroundColor Yellow
       Invoke-WebRequest -Uri $dlurl -OutFile $env:TEMP\git-stable.exe
        Write-Host "`nInstalling git..." -ForegroundColor Yellow
            Start-Process -Wait $env:TEMP\git-stable.exe -ArgumentList /silent
        }
	}	finally
    {
        $ProgressPreference = 'Continue'
    }
        
        
