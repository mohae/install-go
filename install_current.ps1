# Install the current Go release
param([string]$w='')

# version
$version = 'go1.7.1.windows-amd64.msi'

# set defaults
$workDir = 'Documents\code\go'
$url = 'https://storage.googleapis.com/golang/' + $version
$dest = Join-Path $Home "Downloads"
$dest = Join-Path $dest $version

# if $w wasn't passed; use the default
if ($w -eq "") {
    $workspace = Join-Path $Home $workDir
} else {
    $workspace = $w
}

# Setup the Go workspace
New-Item -path $workspace -type directory

# Create GOPATH and set PATH to use $GOPATH\bin
$workspaceBin = Join-Path $workspace "bin"
$workspaceBin = ';' + $workspaceBin

# set the $GOPATH
[Environment]::SetEnvironmentVariable( "GOPATH", $workspace, [System.EnvironmentVariableTarget]::User )

# see the $GOBIN
[Environment]::SetEnvironmentVariable( "GOBIN", $workspaceBin, [System.EnvironmentVariableTarget]::User )

Write-Output "downloading $url"
# Create client, set its info, and download
$wc = New-Object System.Net.WebClient
$wc.UseDefaultCredentials = $true
$wc.Headers.Add("X-FORMS_BASED_AUTH_ACCEPTED", "f")
$wc.DownloadFile($url, $dest)

Write-Output "$url downloaded as $dest"
Write-Output "installing $version..."
# Run the msi
Start-Process $dest

Write-Output "done"
