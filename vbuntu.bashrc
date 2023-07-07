# shorten the depth of directory in command-line
PROMPT_DIRTRIM=1


export BAT_THEME="gruvbox-dark"
export FZF_DEFAULT_COMMAND='find . -type f ! -path "*git*"'
export FZF_DEFAULT_OPTS='--height 100% --layout=reverse --border --bind up:preview-page-up,down:preview-page-down'

# arcticicestudio/nord-vim
# alias pf='fzf --preview="bat --color=always {}" --bind up:preview-page-up,down:preview-page-down'
alias pf='fzf --preview="bat --color=always --number {}"'

# source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"


HISTSIZE=10000
HISTFILESIZE=10000
