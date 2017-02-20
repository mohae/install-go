# version
$v = '1.8'

﻿# Url & destination information
$url = 'https://storage.googleapis.com/golang/go' + $v + '.windows-amd64.zip'
$filename = 'go' + $v + ".zip"
$output = [io.path]::combine($Home, 'Downloads', $filename)

$goroot = [environment]::GetEnvironmentVariable("GOROOT", "Machine")
$gorootAll = $goroot + "*"
Remove-Item $gorootAll -recurse

# Create client, set its info, and download
$wc = New-Object System.Net.WebClient
$wc.UseDefaultCredentials = $true
$wc.Headers.Add("X-FORMS_BASED_AUTH_ACCEPTED", "f")
$wc.DownloadFile($url, $output)

Write-Output "$url downloaded as $output"

# Unzip the file
Expand-Archive -Force -Path $output -DestinationPath $goroot\..
