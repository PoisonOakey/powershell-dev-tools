# PowerShell Developer Experience

This project provides a comprehensive setup script to install essential PowerShell tools, improving your command-line experience with syntax highlighting, predictive intellisense, beautiful prompts, and more.

## What this setup does

The `Setup-PowerShellTools.ps1` script automatically installs the following tools:

- `PSScriptAnalyzer` - Microsoft’s official code linter and preemptive debugger for PowerShell.
- `tldr` - Community-driven, simplified man pages for command-line tools with practical examples.
- `PSReadLine` - Enhanced command-line editing, history, and syntax highlighting.
- `Oh-My-Posh` - Highly customizable and beautiful terminal prompts.
- `Terminal-Icons` - Adds visual icons to file and folder listings.
- `zoxide` - A smarter `cd` command that learns your navigation habits.
- `Pester` - The standard testing and mocking framework for PowerShell.
- `platyPS` - Generates PowerShell external help from Markdown files.

## Project structure

```text
powershell-developer-tools/
├── Setup-PowerShellTools.ps1
├── CHANGELOG.md
├── .gitignore
└── README.md
```

## Prerequisites

- Windows PowerShell 5.1 or PowerShell 7+.
- `winget` (Windows Package Manager) is recommended for installing Oh-My-Posh and zoxide.

## Setup

Before running the setup, ensure your PowerShell execution policy allows running scripts.

### Windows (PowerShell)

If PowerShell blocks the script, run this once:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

Then, run the setup script to install all the tools:

```powershell
.\Setup-PowerShellTools.ps1
```

> Important: The script primarily installs modules into your `CurrentUser` scope, so administrator privileges are usually not required. Make sure you add the suggested imports to your `$PROFILE` after installation!

## How to use the tools

After running the setup and adding the recommended lines to your `$PROFILE` (`notepad $PROFILE`), restart your terminal. Here is how you can use your newly installed tools:

### PSScriptAnalyzer
To catch syntax errors and bad practices in your scripts:
```powershell
Invoke-ScriptAnalyzer -Path "C:\Path\To\Your\Script.ps1"
```

### tldr
To get a quick, practical example for any command (instead of reading a huge manual):
```powershell
tldr Get-Process
```

### PSReadLine & Oh-My-Posh
These work automatically! You will notice syntax highlighting as you type, predictive text based on your history, and a beautiful custom prompt.

### Terminal-Icons
Simply list the contents of a directory to see the new icons next to your files and folders:
```powershell
ls
# or
Get-ChildItem
```

### zoxide (z)
Use `z` instead of `cd` to navigate quickly. It learns where you go, so you don't need full paths!
```powershell
z projects   # Jumps directly to a directory named "projects" you've visited before
```

### Pester & platyPS
- Run `Invoke-Pester` in your project root to execute your tests.
- Use `New-MarkdownHelp` to convert your documentation into standard help files.

## Notes about the current setup

- The tools are installed using `Install-Module` from the PSGallery.
- Oh-My-Posh and Zoxide will attempt to use `winget` if available for a more modern installation.
- Features like predictive intellisense may require PowerShell 7+ for the absolute best experience.
