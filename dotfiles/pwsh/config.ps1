# section: env vars

$env:PYTHONIOENCODING="utf-8"
# iex "$(thefuck --alias)"

Function prompt { "$($( get-item $PWD ).FullName.Replace($HOME, '~')) $ " }

Function pip-alias-fn { (python3 -m pip @args) }
New-Alias -Name pip -Value pip-alias-fn
Function venv-alias-fn { (python3 -m venv @args) }
New-Alias -Name venv -Value venv-alias-fn
Function python-alias-fn { (python3 @args) }
New-Alias -Name python -Value python-alias-fn
New-Alias -Name py -Value python-alias-fn

# section: functions / aliases

Function glances-alias-fn { (glances --percpu --disable-irix --separator --programs @args) }
New-Alias -Name glances -Value glances-alias-fn

Function svpush {
    (git add .)
    if ($?) {
        (git commit -m $args[0])
        if ($?) {
            (git push)
        }
    }
}

Function ln {
    if ($args[0] -ieq "/d" -Or $args[0] -ieq "-d" -Or $args[0] -ieq "/sd" -Or $args[0] -ieq "-sd" -Or $args[0] -ieq "/ds" -Or $args[0] -ieq "-ds") {
        # note: if directory (i cba to do actual stuff)
        (cmd /c mklink /D $args[2] $args[1])
    } else {
        (cmd /c mklink $args[1] $args[0])
    }
}
