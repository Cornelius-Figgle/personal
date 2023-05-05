# section: env vars

$env:PYTHONIOENCODING="utf-8"
# iex "$(thefuck --alias)"

Function prompt {
    "$($( get-item $PWD ).FullName.Replace($HOME, '~')) $ "
}


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
    if ($args[0] -ieq "/d" -Or $args[0] -ieq "-d" -Or $args[0] -ieq "/sd" -Or $args[0] -ieq "-sd" -Or $args[0] -ieq "/ds" -Or $args[0] -ieq "-ds") {
        # note: if directory (i cba to do actual stuff)
        cmd /c mklink /D $args[2] $args[1]
    } else {
        cmd /c mklink $args[1] $args[0]
    }
}