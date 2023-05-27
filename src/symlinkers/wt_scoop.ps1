###############
# Install.ps1 #
###############

# i hate git sometimes

# Make sure Windows Terminal have been installed.
$TerminalPath = "C:\Users\Max.Harrison\AppData\Local\Microsoft\Windows Terminal"  # old: c:\users\max.harrison\appdata\local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe";
if(!(Test-Path $TerminalPath)) {
    Throw "Windows Terminal have not been installed."
}

# Create symlink to Windows Terminal settings.
$TerminalProfileSource = Join-Path  "C:\Users\Max.Harrison\source\personal\dotfiles\wt" "settings.json"
$TerminalProfileDestination = Join-Path $TerminalPath "settings.json";  # old: LocalState/settings.json";
if(Test-Path $TerminalProfileDestination) {
    Remove-Item -Path $TerminalProfileDestination;
}
Write-Host "Creating symlink to Windows terminal settings..."
New-Item -Path $TerminalProfileDestination -ItemType SymbolicLink -Value $TerminalProfileSource | Out-Null;