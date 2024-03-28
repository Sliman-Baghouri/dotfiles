#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
alias hyprconf='nvim .dotfiles/hypr/hyprland.conf'
alias rc='nvim .bashrc'
export PATH="$PATH:/path/to/flutter/bin"
export PATH="$PATH:/home/rodya/Downloads/flutter/bin"
export CHROME_EXECUTABLE="/usr/bin/chromium"
alias vi='nvim'
export OPENAI_API_KEY="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"
export ANDROID_HOME=$HOME/Android/Sdk
# export PATH=$PATH:$ANDROID_HOME/tools


# pnpm
export PNPM_HOME="/home/rodya/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
