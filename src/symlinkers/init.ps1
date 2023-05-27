# note: pwsh config management & auto-creation

$CONFIG_DATA = @'
# note: btw this file should be created automatically if it doesn't already exist
# note: and should not be modified

# note: this file exists bc `mklink` is stupid and doesn't let me symlink across networked drives
# note: and pwsh stores its files in `U:\My Documents\PowerShell` (on my setup at least - I have `U:` mapped to a server user folder or smth)
# note: so we get around this by just copying it into this file

try {
    # note: copy in main config
    . "$HOME\source\personal\dotfiles\pwsh\config.ps1"
} catch [System.Exception] {
    # note: if file not found
    try {
        # note: copy in main config
        . "T:\personal\dotfiles\pwsh\config.ps1"
    } catch [System.Exception] {
        # note: if file still not found
        throw
    }
}

$Env:PWSH_CFG_IS_GOOD = $true
'@

$SYS_CFG_PATH = $PROFILE.CurrentUserCurrentHost


if ($Env:PWSH_CFG_IS_GOOD -ne $true -or $args[0] -ieq "-f") {
    # note: if our file doesn't exist
    # note: or we specify force

    Write-Output "making sys config now"

    Write-Output $CONFIG_DATA | Out-File -FilePath $SYS_CFG_PATH  # note: writes the file data to the config

    Write-Output "sys config file written"
    Write-Output "reloading pwsh profile now"

    & $profile  # note: reloads profile
} else {
    Write-Output "sys config not created, env var `SYS_CFG_PATH` is set!"
}