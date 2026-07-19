# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Added
- `Setup-PowerShellTools.ps1`: A comprehensive script to install essential PowerShell developer tools including TLDR, PSReadLine, Oh-My-Posh, Terminal-Icons, zoxide, Pester, and platyPS.
- `.gitignore`: Standard ignore file for OS and IDE specific files.
- Added instructions to `README.md` on how to use the setup script.

### Fixed / Improved
| Component | Change Description | Reason / Benefit |
| :--- | :--- | :--- |
| **`tldr` Install** | Switched from `Install-Module` to `winget install tldr-pages.tlrc` | No official module exists on PSGallery; uses the official Rust client via winget. |
| **`PSReadLine` Install** | Removed the `-AllowPrerelease` parameter | Older PowerShellGet versions crashed when encountering this flag. |
| **Network Protocol** | Forced `TLS 1.2` at the start of the script | Prevents silent download failures on older systems. |
| **`Oh-My-Posh` Config** | Replaced `Set-PoshPrompt` with `oh-my-posh init powershell` | Migrated from deprecated PSModule to modern executable. Removed strict theme path to rely on default built-in theme. |
| **User Profile** | Fully automated `$PROFILE` creation and modification | Eliminated manual copy/pasting. Script is now strictly idempotent. |
| **PSScriptAnalyzer** | Replaced all `Write-Host` usages with `Write-Output` | Strict compliance with PowerShell best practices and linting rules. |
| **PSScriptAnalyzer** | Stripped trailing whitespaces and enforced UTF-8 BOM encoding | Passed all lint checks perfectly. |
| **Documentation** | Removed manual `$PROFILE` config instructions from `README.md` | The setup script now fully automates the profile creation and modification. |
| **Documentation** | Added explanation of `zoxide` initialization to `README.md` | Clarified that users must manually `cd` into a directory at least once before zoxide can track it. |
