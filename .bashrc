#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
alias hyprconf='nvim ~/.dotfiles/.config/hypr/hyprland.conf'
alias rc='nvim .bashrc'
export PATH="$PATH:/path/to/flutter/bin"
export PATH="$PATH:/home/rodya/Downloads/flutter/bin"
export CHROME_EXECUTABLE="/usr/bin/chromium"
alias vi='nvim'
export ANDROID_HOME=$HOME/Android/Sdk
# export PATH=$PATH:$ANDROID_HOME/tools


