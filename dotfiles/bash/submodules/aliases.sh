alias cls='clear'

alias winfetch='pwsh -c winfetch'  # note: pwsh has weird module loading bars so we call it into pwsh where these are disabled (I couldn't work out how to do it in git-bash)

function svpush () {
	git add .
	git commit -m "$*"  # info: https://unix.stackexchange.com/a/197794/551787
	git push
}

if [ $HOSTNAME = mimic3 ]; then
	alias ter='/mnt/p/00\ Max/mimic/ter_start.sh'
	alias mc='/mnt/p/00\ Max/mimic/mc_start.sh'
fi

alias glances='glances --percpu --disable-irix --separator --programs'
alias rdp='xfreerdp -v NightCrawler -d FULLIMAGE -u max.harrison --sec tls \
	--disable-wallpaper --disable-themes --disable-fonts --disable-aero --disable-window-drag --disable-menu-anims \
	-f'

# alias pip='python3 -m pip'
# alias venv='python3 -m venv'
# alias python='python3'
# alias py='python3'

alias pacman-backup='pacman -Qqe | grep -v "$(pacman -Qqm)"'
alias aur-backup='pacman -Qqm'
alias pacman-restore='xargs pacman -S --needed --noconfirm'
alias aur-restore='echo "NO RESTORE LINE YET"'

alias lxappearance='GDK_BACKEND=x11 lxappearance'
