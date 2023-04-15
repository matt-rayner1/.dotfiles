# Path to your oh-my-zsh installation.
export ZSH="/home/user0/.oh-my-zsh"

# THEME CHOICE
ZSH_THEME="bureau"

#Plugin list
#TODO: add fzf
plugins=(
	git
	zsh-autosuggestions
)

# source oh my zsh
source $ZSH/oh-my-zsh.sh

# case sensitive completion
# CASE_SENSITIVE="true"

# Generic settings:
setopt nonomatch	# hide error msg if no match for pattern
setopt notify		# report status of background jobs immediately
setopt numericglobsort	# sort filenames numerically when it makes sense
setopt promptsubst	# enable command substitution in prompt

WORDCHARS=${WORDCHARS//\/} # dont consider certain chars part of word

# hide EOL sign ('%')
PROMPT_EOL_MARK=""

# key bindings
bindkey -v			# vim key bindings
bindkey ' ' magic-space		# do history expansion on space
bindkey '^ ' autosuggest-accept

# enable autocompletion
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle :compinstall filename '$HOME/.zshrc'
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive completion

# Histfile settings:
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# color settings
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias fgrep='fgrep --color=auto'
	alias grep='grep --color=auto'
	alias egrep='egrep --color=auto'
	alias diff='diff --color=auto'
	alias ip='ip --color=auto'
fi

if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
	. /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

if [ -f /etc/zsh_command_not_found ]; then
	. /etc/zsh_command_not_found
fi

# Alias settings
alias history="history 0"
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias zshrc="nvim ~/.zshrc"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vwik="nvim ~/vimwiki/index.wiki"

export PATH=$PATH:/home/user0/.local/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

