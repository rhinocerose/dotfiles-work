alias reload='source ~/.bashrc'

alias ll='ls -lah'
alias l='ls -la'
alias ..='cd ..'
alias ...='cd ../..'
alias df='df -h' 
alias du='du -d 1 -h'

alias sudo='sudo '
alias sysctlr='sudo systemctl restart'
alias sysctls='sudo systemctl status'
alias sysctlst='sudo systemctl start'
alias sysctldr='sudo systemctl daemon-reload'


function cd () {
	if [ -n "$1" ]; then
		builtin cd "$@" && ll
	else
		builtin cd ~ && ll
	fi
}

eval "$(starship init bash)"
