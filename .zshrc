# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias zshcf="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias nvimcf="cd ~/.config/nvim/ && nvim init.lua"
alias xmonadcf="cd ~/.config/xmonad/ && nvim xmonad.hs"
alias xmobarcf="nvim .xmobarrc"
