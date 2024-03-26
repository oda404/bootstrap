if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status is-login
    contains ~/.local/bin $PATH
    or set PATH ~/.local/bin $PATH
end

set -g fish_greeting

set -x PYTHONSTARTUP ~/.pystart

# Dev commands
# alias dxgmx="cd $HOME/Documents/cpp/dxgmx/ && source toolchain/toolchain-i686.sh && source tools/run-qemu-x86-default-vars.sh"
alias terminal="cd $HOME/Documents/cpp/terminal && source toolchain/toolchain-i686.sh && source tools/run-qemu-x86-default-vars.sh"
alias fatboy="cd $HOME/Documents/linux/fatboy-6.6.4 && linuxtoolchain"
alias linuxtoolchain="export CC=clang && export HOSTCC=clang && export LLVM=1 && export KCONFIG_CONFIG=config.fatboy"

# Git shortcuts
alias ga="git add"
alias gap="git add --patch"
alias gs="git status"
alias gl="git log"
alias gc="git commit"
alias gp="git push"
alias gd="git diff"
alias gpl="git pull"
alias gittok="doas cat ~/Documents/txt/tok"

# Shorts
alias sudo="doas"
alias ss="doas systemctl"
alias rgrep="grep -r"
alias py="python"

# conda is started on demand because starting it for every shell session is slow as hell
alias conda-start='eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source'

# System
set EDITOR nvim

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/miniconda3/bin/conda
	#eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

