alias reload='source ~/.bashrc'
alias venv='source ~/.virtualenv/forservices/bin/activate'

alias ll='ls -lah'
alias l='ls -la'
alias rr='rm -rf'
alias ..='cd ..'
alias ...='cd ../..'
alias df='df -h' 
alias du='du -d 1 -h'

alias sudo='sudo '
alias sysctlr='sudo systemctl restart'
alias sysctls='sudo systemctl status'
alias sysctlst='sudo systemctl start'
alias sysctldr='sudo systemctl daemon-reload'

function rr () {
	builtin rm -rf "$1"
}

function cd () {
	if [ -n "$1" ]; then
		builtin cd "$@" && ll
	else
		builtin cd ~ && ll
	fi
}

eval "$(starship init bash)"
