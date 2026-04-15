_ls_flags="-gGh --group-directories-first --almost-all --no-group --time-style=long-iso --color=always"

alias ls="ls --color=auto"
alias la="ls ${_ls_flags}"
alias lat="ls ${_ls_flags} -rt"
alias todo='todo.sh -d $HOME/.config/todo/todo.cfg'
