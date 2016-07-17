# Url & destination
$url = 'https://storage.googleapis.com/golang/go1.6.2.windows-amd64.zip'
$output = Join-Path $Home "Downloads\go.zip"

#Upgrade to current release of Go
$bin = Join-Path $env:GOPATH bin\*
$pkg = Join-Path $env:GOPATH pkg\*
# Remove existing artifacts
if (Test-Path $bin) {
    Remove-Item $bin -recurse
}
if (Test-Path $pkg) {
    Remove-Item $pkg -recurse
}
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