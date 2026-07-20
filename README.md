# PowerShell Developer Experience

>This project provides a comprehensive setup script to install essential PowerShell tools, improving your command-line experience with syntax highlighting, predictive intellisense, beautiful prompts, and more.

---

## :question: What this setup does

The `Setup-PowerShellTools.ps1` script automatically installs the following tools:

- `PSScriptAnalyzer` - Microsoft’s official code linter and preemptive debugger for PowerShell.
- `tldr` - Community-driven, simplified man pages for command-line tools with practical examples.
- `PSReadLine` - Enhanced command-line editing, history, and syntax highlighting.
- `Oh-My-Posh` - Highly customizable and beautiful terminal prompts.
- `Terminal-Icons` - Adds visual icons to file and folder listings.
- `zoxide` - A smarter `cd` command that learns your navigation habits.
- `Pester` - The standard testing and mocking framework for PowerShell.
- `platyPS` - Generates PowerShell external help from Markdown files.

---

## :file_folder: Project structure

```text
powershell-dev-tools/
├── Setup-PowerShellTools.ps1
├── CHANGELOG.md
├── .gitignore
└── README.md
```

---

## :seedling: Prerequisites

- Windows PowerShell 5.1 or PowerShell 7+.
- `winget` (Windows Package Manager) is recommended for installing Oh-My-Posh and zoxide.

---

## :ocean: Setup

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

>[!IMPORTANT]
>The script primarily installs modules into your `CurrentUser` scope, so administrator privileges are usually not required. The script will also automatically configure your `$PROFILE` for you!

---

## :sun_with_face: How to Use

After running the setup, simply restart your terminal (close and reopen it). Here is how you can use your newly installed tools:

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
>[!IMPORTANT]
>Because zoxide learns from your habits, it starts with an empty database. You must `cd` into a directory the old-fashioned way at least once before zoxide will remember it!
```powershell
z projects   # Jumps directly to a directory named "projects" you've visited before
```


### Pester & platyPS
- Run `Invoke-Pester` in your project root to execute your tests.
- Use `New-MarkdownHelp` to convert your documentation into standard help files.

---

## :notebook_with_decorative_cover: Notes

- The tools are installed using `Install-Module` from the PSGallery.
- Oh-My-Posh and Zoxide will attempt to use `winget` if available for a more modern installation.
- Features like predictive intellisense may require PowerShell 7+ for the absolute best experience.

---
  
