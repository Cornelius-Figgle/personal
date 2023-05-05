# section: env vars

$env:PYTHONIOENCODING="utf-8"
# iex "$(thefuck --alias)"



# section: functions / aliases

Function glncs {
    glances --fs-free-space --process-short-name --percpu --program --disable-irix
}
# New-Alias -Name glances -Value glncs

Function svpush {
    git add .
    if ($?) {
        git commit -m $args[0]
        if ($?) {
            git push
        }
    }
}

Function ln {
    if ($args[0] -eq "/D" -Or $args[0] -eq "/d" -Or $args[0] -eq "-D" -Or $args[0] -eq "-d") {
        # note: if directory (i cba to do actual stuff)
        cmd /c mklink /D $args[2] $args[1]
    } else {
        cmd /c mklink $args[1] $args[0]
    }
}