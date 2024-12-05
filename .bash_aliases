#!/usr/bin/env bash
# some more ls aliases
alias l='ls -CF'
# alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto --hyperlink=auto'
alias la='eza -A'
alias ld='eza -1 --icons -D'
alias le='eza -l --icons'
alias lf='eza -1 --icons -f'
alias lG='eza --grid'
alias lR='eza --recurse'
alias lT='eza --tree'

# ranger like file manager
# alias js='joshuto'
alias rg='ranger'
alias yi='yazi'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# perl debugger server start
alias perldap='perl -MPerl::LanguageServer -e "Perl::LanguageServer::run" -- --port 27011 --version "2.5.0"'

# 科学上网
alias px0='export HTTP_PROXY="127.0.0.1:1095"'
alias px1='export HTTPS_PROXY="127.0.0.1:1095"'
alias px2='export ALL_PROXY="127.0.0.1:1095"'
alias px3='export all_proxy="127.0.0.1:1095"'

alias unpx0='export HTTP_PROXY="127.0.0.1:1095"'
alias unpx1='export HTTPS_PROXY="127.0.0.1:1095"'
alias unpx2='export ALL_PROXY="127.0.0.1:1095"'
alias unpx3='export all_proxy="127.0.0.1:1095"'

# 用bat替换cat
alias cat='bat --paging=never'
alias bathelp='bat --plain --language=help'

# kitty别名
alias icat="kitty +kitten icat"
alias s="kitty +kitten ssh"
alias d="kitten diff"
alias hg="kitten hyperlinked_grep"

# 切换目录快捷键
alias gc='cd $HOME/.config'
alias gD='cd $HOME/下载'
alias gH='cd $HOME/.config/hypr'
alias gp='cd $HOME/图片'
alias gw='cd $HOME/图片/Wallpapers'
#
# git bare裸库，用于配置文件管理
alias dot-git='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# 自动删除不需要的软件包
alias autoremove="sudo pacman -Qtdq | sudo pacman -Rns -"
# 使用lazygit管理裸库
alias dot-lg='lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# 显示按键
alias sk='wshowkeys -b "#0000000f" -f "#eee8d8" -s "#ece87a" -t 1 -a right -a bottom -m 32 &'
