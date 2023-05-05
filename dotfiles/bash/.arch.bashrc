#
# ~/.bashrc
#


# note: find path to the directory of the script
# info: https://stackoverflow.com/a/179231/19860022
pushd . > '/dev/null';
SCRIPT_PATH="${BASH_SOURCE[0]:-$0}";
while [ -h "$SCRIPT_PATH" ]; do
    cd "$( dirname -- "$SCRIPT_PATH"; )";
    SCRIPT_PATH="$( readlink -f -- "$SCRIPT_PATH"; )";
done
cd "$( dirname -- "$SCRIPT_PATH"; )" > '/dev/null';
SCRIPT_PATH="$( pwd; )";
popd  > '/dev/null';


# include .bashrc if it exists
if [ -f $SCRIPT_PATH/.bashrc ]; then
    . $SCRIPT_PATH/.bashrc
fi


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
PS1=' \w \$ '

alias pip='pip3'
