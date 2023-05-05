
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