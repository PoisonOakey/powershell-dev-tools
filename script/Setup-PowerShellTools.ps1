# Requires -RunAsAdministrator for some global installations,
# but mostly installs to CurrentUser scope for safety.

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Write-Output "Setting up PowerShell Developer Experience..."

# 1. Ensure PowerShellGet and PackageManagement are up to date
Write-Output "Updating PowerShellGet..."
Install-Module -Name PowerShellGet -Force -AllowClobber -Scope CurrentUser

# 2. PSReadLine - The ultimate command line editing experience (usually built-in, but good to update)
# Provides syntax highlighting, predictive intellisense, and better history
Write-Output "Installing/Updating PSReadLine..."
Install-Module -Name PSReadLine -Force -Scope CurrentUser

# 3. TLDR - The "Too Long; Didn't Read" cheat sheets for command line tools
Write-Output "Installing TLDR..."
if (Get-Command winget -ErrorAction SilentlyContinue) {
    winget install tldr-pages.tlrc
}
else {
    Write-Output "Winget not found, skipping TLDR. Consider installing it manually."
}
# Note: You can now use `tldr <command>` to get quick examples!

# 4. Oh-My-Posh - Beautiful, customizable terminal prompts
Write-Output "Installing Oh-My-Posh..."
# Using winget for oh-my-posh is the recommended modern way
if (Get-Command winget -ErrorAction SilentlyContinue) {
    winget install JanDeDobbeleer.OhMyPosh -s winget
}
else {
    Install-Module oh-my-posh -Force -Scope CurrentUser
}

# 5. Terminal-Icons - Adds icons to your 'ls' (Get-ChildItem) output
Write-Output "Installing Terminal-Icons..."
Install-Module -Name Terminal-Icons -Force -Scope CurrentUser

# 6. Zoxide (z) - A smarter 'cd' command that learns your habits
Write-Output "Installing zoxide..."
if (Get-Command winget -ErrorAction SilentlyContinue) {
    winget install ajeetdsouza.zoxide
}
else {
    Write-Output "Winget not found, skipping zoxide. Consider installing it manually."
}

# 7. Pester - The standard testing framework for PowerShell
Write-Output "Installing Pester..."
Install-Module -Name Pester -Force -SkipPublisherCheck -Scope CurrentUser

# 8. platyPS - Write PowerShell External Help in Markdown
Write-Output "Installing platyPS..."
Install-Module -Name platyPS -Force -Scope CurrentUser

Write-Output "`nInstallation Complete! ðŸŽ‰"

Write-Output "Configuring your PowerShell Profile..."

# Create the profile and its directory if it doesn't exist
$profileDir = Split-Path -Path $PROFILE
if (!(Test-Path -Path $profileDir)) {
    New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
}
if (!(Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force | Out-Null
}

$profileContent = Get-Content $PROFILE -ErrorAction SilentlyContinue

$linesToAdd = @(
    "Import-Module PSReadLine",
    "Import-Module Terminal-Icons",
    "oh-my-posh init powershell | Invoke-Expression",
    "Invoke-Expression (& { (zoxide init powershell | Out-String) })"
)

$addedAny = $false
foreach ($line in $linesToAdd) {
    if ($profileContent -notcontains $line) {
        Add-Content -Path $PROFILE -Value $line
        $addedAny = $true
    }
}

if ($addedAny) {
    Write-Output "âœ… Successfully added the new tools to your `$PROFILE!"
}
else {
    Write-Output "âœ… Your `$PROFILE is already configured with these tools."
}

Write-Output "`nSetup is 100% finished! Please close this terminal and open a new one to see your new setup in action!"
