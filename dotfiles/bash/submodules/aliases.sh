
alias cls='clear'

function svpush () {
	git add .
	git commit -m $1
	git push
}

if [ $HOSTNAME = mimic3 ]; then
    alias ter='/mnt/p/00\ Max/mimic/ter_start.sh'
    alias mc='/mnt/p/00\ Max/mimic/mc_start.sh'
fi

alias glances='glances --percpu --disable-irix --separator --programs'

# alias pip='python3 -m pip'
# alias venv='python3 -m venv'
# alias python='python3'
# alias py='python3'

alias pacman-backup='pacman -Qqe | grep -v "$(pacman -Qqm)"'
alias aur-backup='pacman -Qqm'
alias pacman-restore='xargs pacman -S --needed --noconfirm'
alias aur-restore='echo "NO RESTORE LINE YET"'
