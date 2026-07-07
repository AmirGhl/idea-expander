# Install the idea-expander skill into your Claude Code skills directory.
$ErrorActionPreference = 'Stop'

$src  = Join-Path $PSScriptRoot 'skills\idea-expander'
$dest = Join-Path $env:USERPROFILE '.claude\skills'

New-Item -ItemType Directory -Force -Path $dest | Out-Null
Copy-Item -Recurse -Force $src $dest

Write-Host "Installed idea-expander to $dest\idea-expander"
Write-Host "Restart Claude Code (or reload skills), then run: /idea-expander"
