#! /bin/bash

# reload bash config
alias reload_bash='source ~/.bashrc'

# more ls aliases
alias l='ls -lah'
alias ll='ls -alFh --group-directories-first --color=auto'
alias la='ls -AF'

# programs shortcut
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi
alias g='git'

# git completion with aliases
source /usr/share/bash-completion/completions/git
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
    || complete -o default -o nospace -F _git g

# tmux
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'

# Helpers
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

# stats
alias right='stat -c%A'
alias fs='stat -c %s'

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "$method"="lwp-request -m '$method'"
done

# Utils
alias lcpp='find . -name \*.cpp -print | cut -d'/' -f2-'

# Functions (not really aliases but...)
function md() {
    mkdir -p $1
    cd $1
}

# Templates generator from ~/Templates -> nw_<filename>
for file_path in ~/Templates/*; do
    s=$file_path
    filename=${s##*/}
    basename=${filename%.*}
    ext=${filename#*.}
    eval "nw_$basename() {
        if [ -z \"\$1\" ]; then
            cp $file_path .
	    vim \$1
        else
            cp $file_path \$1.$ext
	    vim \$1.$ext
        fi
    }"
done

function last_apt() {
    grep " install " /var/log/apt/history.log |  awk 'NF>1{print $NF}'
}
