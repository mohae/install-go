# Install the current Go release
$url = 'https://storage.googleapis.com/golang/go1.7.windows-amd64.msi'

# Setup the vars
$workDir = "Documents\code\go"
$workspace = Join-Path $Home $workDir
$output = Join-Path $Home "Downloads\go.msi"

# Setup the Go workspace
New-Item -path $workspace -type directory

# Create GOPATH and set PATH to use $GOPATH\bin
$workspaceBin = Join-Path $workspace "\bin"
$workspaceBin = ';' + $workspaceBin
[Environment]::SetEnvironmentVariable( "GOPATH", $workspace, [System.EnvironmentVariableTarget]::User )
# Docs seem to say that: $env:Path + $workspaceBin should be used; but that results in repeating
# Path info; this seems to get the desired result.
[Environment]::SetEnvironmentVariable( "Path", $workspaceBin, [System.EnvironmentVariableTarget]::User )

# Create client, set its info, and download
$wc = New-Object System.Net.WebClient
$wc.UseDefaultCredentials = $true
$wc.Headers.Add("X-FORMS_BASED_AUTH_ACCEPTED", "f")
$wc.DownloadFile($url, $output)

Write-Output "$url downloaded as $output"

# Run the msi
Start-Process $output
