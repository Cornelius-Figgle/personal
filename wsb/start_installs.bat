START taskmgr.exe

cd "C:\Users\WDAGUtilityAccount\setup"
"AutoHotkey_1.1.35.00_setup.exe" /S

curl -L "https://update.code.visualstudio.com/latest/win32-x64-user/stable" --output "C:\Users\WDAGUtilityAccount\Downloads\vscode-silent.exe"
"C:\Users\WDAGUtilityAccount\Downloads\vscode-silent.exe" /silent

"python-3.11.0-amd64.exe" /passive PrependPath=1 Include_pip=1 InstallAllUsers=1

"Git-2.37.1-64-bit.exe" /SILENT /LOADINF="C:\Users\WDAGUtilityAccount\scripts\git_config.cfg"

cd %UserProfile%

"C:\Users\WDAGUtilityAccount\AppData\Local\Programs\Git\git-bash.exe"
"C:\Users\WDAGUtilityAccount\AppData\Local\Programs\Git\git-cmd.exe"

Regedit "C:\Users\WDAGUtilityAccount\scripts\no-close-cmd.reg"

echo DOne