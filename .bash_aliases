alias reload='source ~/.bashrc'

alias ll='ls -lah'
alias l='ls -la'
alias rr='rm -rf'
alias ..='cd ..'
alias ...='cd ../..'
alias df='df -h' 
alias du='du -d 1 -h'

function cd () {
	if [ -n "$1" ]; then
		builtin cd "$@" && ll
	else
		builtin cd ~ && ll
	fi
}

parse_git_branch() {
	git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

git_colour() {
	if [[ $(git status -s 2>/dev/null) ]]; then
		echo -e "\033[01;31m"
	else
		echo -e "\033[01;32m"
	fi
}
export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\$(git_colour)\]\$(parse_git_branch)\[\e[00m\]$ "
