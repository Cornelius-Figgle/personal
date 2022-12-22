###############
# Install.ps1 #
###############

# Make sure Windows Terminal have been installed.
$TerminalPath = "c:\users\max.harrison\appdata\local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe";
if(!(Test-Path $TerminalPath)) {
    Throw "Windows Terminal have not been installed."
}

# Create symlink to Windows Terminal settings.
$TerminalProfileSource = Join-Path  "c:\users\max.harrison\source\personal\dotfiles\vscode" "settings.json"
$TerminalProfileDestination = Join-Path $TerminalPath "LocalState/settings.json";
if(Test-Path $TerminalProfileDestination) {
    Remove-Item -Path $TerminalProfileDestination;
}
Write-Host "Creating symlink to Windows terminal settings..."
New-Item -Path $TerminalProfileDestination -ItemType SymbolicLink -Value $TerminalProfileSource | Out-Null;