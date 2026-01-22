# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Package Manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# load zinit
source "${ZINIT_HOME}/zinit.zsh"

# End package manager


# make all scripts in ~/.local/bin available (managed by stow)
export PATH=$PATH:~/.local/bin

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Code

# Go (installed to ~/.local/go by ansible)
export GOROOT=$HOME/.local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

export FLYCTL_INSTALL="~/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# Plugins

# Add powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-completions

# load completions
autoload -U compinit && compinit

# should be loaded after completions are loaded and before syntax-highlighting and auto-suggestions
zinit light Aloxaf/fzf-tab

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# zsh-fzf-history-search
zinit ice lucid wait'0'
zinit light joshskidmore/zsh-fzf-history-search

zinit light junegunn/fzf-git.sh
# Keybind	Description
# CTRL-GF	Look for git files with fzf
# CTRL-GB	Look for git branches with fzf
# CTRL-GT	Look for git tags with fzf
# CTRL-GR	Look for git remotes with fzf
# CTRL-GH	Look for git commit hashes with fzf
# CTRL-GS	Look for git stashes with fzf
# CTRL-GL	Look for git reflogs with fzf
# CTRL-GW	Look for git worktrees with fzf
# CTRL-GE	Look for git for-each-ref with fzf 

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::charm
zinit snippet OMZP::composer

zinit cdreplay -q


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
# ctrl + r -> fzf history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --icons=always $realpath'
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'


# aliases
alias c='clear'
alias cat="bat"

alias a="php artisan"
alias nr="npm run"
alias p="python manage.py"

alias gs="git status"
alias gb="git branch"
alias gch="git checkout"
alias glg="git log --oneline --decorate --color"
alias gct="git add . && git commit"
alias ga="git add . && git commit --amend --no-edit "
alias gd="git diff"
alias gpp="git stash pop"
alias gpl="git pull"
alias gpo="git push origin"
alias gsh="git stash"
alias gun="git reset --soft HEAD~1"

# Eza (better ls)
# Install eza: https://github.com/eza-community/eza/blob/main/INSTALL.md#debian-and-ubuntu
# alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ls="eza --color=always --long --git --icons=always"

# shell integrations
# eval "$(fzf --zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init --cmd cd zsh)"
# thefuck (Auto correct commands)
# INSTALL: pip install thefuck
# https://github.com/nvbn/thefuck?tab=readme-ov-file
# eval $(thefuck --alias)

# bun completions
[ -s "~/.bun/_bun" ] && source "~/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="~/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#

function git-o() {
  local url=$(git config --get remote.origin.url)
  if [[ $url == git@* ]]; then
    # Convert SSH URL to HTTPS
    url=${url/git@/https:\/\/}
    url=${url/:/\//}
  fi
  url=${url/.git/}
  # For Linux, use xdg-open; on macOS, use open
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    xdg-open "$url"
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    open "$url"
  else
    echo "Unsupported OS. Please open the URL manually: $url"
  fi
}

# opencode
export PATH=~/.opencode/bin:$PATH
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(~/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
#

export PATH="~/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="~/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# Added by LM Studio CLI (lms)
export PATH="$PATH:~/.lmstudio/bin"
# End of LM Studio CLI section

export PATH="/opt/homebrew/opt/php@8.3/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.3/sbin:$PATH"

# alias -g og='| ollama run gemma3:12b'
alias -g olg='| ollama run gemma3:4b'
alias -g olgs='| ollama run gemma3:1b'

alias -g opc='| opencode run --model anthropic/claude-3-5-sonnet-20240620'

alias claude="~/.claude/local/claude"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
source "$HOME/.cargo/env"

# Load machine-specific configuration
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
