# Requires -RunAsAdministrator for some global installations, 
# but mostly installs to CurrentUser scope for safety.

Write-Host "Setting up PowerShell Developer Experience..." -ForegroundColor Cyan

# 1. Ensure PowerShellGet and PackageManagement are up to date
Write-Host "Updating PowerShellGet..." -ForegroundColor Yellow
Install-Module -Name PowerShellGet -Force -AllowClobber -Scope CurrentUser

# 2. PSReadLine - The ultimate command line editing experience (usually built-in, but good to update)
# Provides syntax highlighting, predictive intellisense, and better history
Write-Host "Installing/Updating PSReadLine..." -ForegroundColor Yellow
Install-Module -Name PSReadLine -AllowPrerelease -Force -Scope CurrentUser

# 3. TLDR - The "Too Long; Didn't Read" cheat sheets for command line tools
Write-Host "Installing TLDR..." -ForegroundColor Yellow
Install-Module -Name tldr -Force -Scope CurrentUser
# Note: You can now use `tldr <command>` to get quick examples!

# 4. Oh-My-Posh - Beautiful, customizable terminal prompts
Write-Host "Installing Oh-My-Posh..." -ForegroundColor Yellow
# Using winget for oh-my-posh is the recommended modern way
if (Get-Command winget -ErrorAction SilentlyContinue) {
    winget install JanDeDobbeleer.OhMyPosh -s winget
} else {
    Install-Module oh-my-posh -Force -Scope CurrentUser
}

# 5. Terminal-Icons - Adds icons to your 'ls' (Get-ChildItem) output
Write-Host "Installing Terminal-Icons..." -ForegroundColor Yellow
Install-Module -Name Terminal-Icons -Force -Scope CurrentUser

# 6. Zoxide (z) - A smarter 'cd' command that learns your habits
Write-Host "Installing zoxide..." -ForegroundColor Yellow
if (Get-Command winget -ErrorAction SilentlyContinue) {
    winget install ajeetdsouza.zoxide
} else {
    Write-Host "Winget not found, skipping zoxide. Consider installing it manually." -ForegroundColor Red
}

# 7. Pester - The standard testing framework for PowerShell
Write-Host "Installing Pester..." -ForegroundColor Yellow
Install-Module -Name Pester -Force -SkipPublisherCheck -Scope CurrentUser

# 8. platyPS - Write PowerShell External Help in Markdown
Write-Host "Installing platyPS..." -ForegroundColor Yellow
Install-Module -Name platyPS -Force -Scope CurrentUser

Write-Host "`nInstallation Complete! 🎉" -ForegroundColor Green
Write-Host "To enable these tools permanently, you need to add them to your PowerShell profile." -ForegroundColor Cyan
Write-Host "You can edit your profile by typing: notepad `$PROFILE" -ForegroundColor Cyan
Write-Host "`nRecommended Profile Additions:" -ForegroundColor Yellow
Write-Host "--------------------------------"
Write-Host 'Import-Module PSReadLine'
Write-Host 'Import-Module Terminal-Icons'
Write-Host 'Set-PoshPrompt -Theme jandedobbeleer'
Write-Host 'Invoke-Expression (& { (zoxide init powershell | Out-String) })'
Write-Host "--------------------------------"
