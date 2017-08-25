# version
param(
	[string]$v='1.9'
)

# Url & destination information
$url = 'https://storage.googleapis.com/golang/go' + $v + '.windows-amd64.zip'
$filename = 'go' + $v + ".zip"
$output = [io.path]::combine($Home, 'Downloads', $filename)

# Remove old go installation
$goroot = [environment]::GetEnvironmentVariable("GOROOT", "Machine")
$gorootAll = $goroot + "*"
Write-Output "removing the currently installed Go from $goroot"
Remove-Item $gorootAll -recurse

# Create client, set its info, and download
Write-Output "downloading $filename from $url"

$wc = New-Object System.Net.WebClient
$wc.UseDefaultCredentials = $true
$wc.Headers.Add("X-FORMS_BASED_AUTH_ACCEPTED", "f")
$wc.DownloadFile($url, $output)

Write-Output "$url downloaded as $output"

# Unzip the file
Write-Output "extracting $filename to $goroot"
Expand-Archive -Force -Path $output -DestinationPath $goroot\..
