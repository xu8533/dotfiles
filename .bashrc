#!/usr/bin/env bash
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
# 打开alias扩展
# shopt -s expand_aliases

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
# if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
# debian_chroot=$(cat /etc/debian_chroot)
# fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
# force_color_prompt=yes

# if [ -n "$force_color_prompt" ]; then
# 	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
# 		# We have color support; assume it's compliant with Ecma-48
# 		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# 		# a case would tend to support setf rather than setaf.)
# 		color_prompt=yes
# 	else
# 		color_prompt=no
# 	fi
# fi
#
if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \W\a\]$PS1"
	;;
*) ;;

esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. "$HOME/.bash_aliases"
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# fastfetch -l Scientific
# fastfetch
neofetch

# export STARSHIP_CONFIG=~/.config/starship/starship.toml
# eval "$(starship init bash)"
eval "$(oh-my-posh init bash --config ~/.config/omp/my.omp.json)"

# AstroNvim中obsidian插件使用
# NOTES="/media/xujian/工作/学习/个人笔记"
# export NOTES

# myfzf.bash中man-find函数使用
MANPATH="/usr/share/man/"
export MANPATH
MANROFFOPT="-c"
export MANROFFOPT

# neovim switcher
# alias vi-chad="NVIM_APPNAME=NvChad vi"
# alias vi-lazy="NVIM_APPNAME=LazyVim vi"
# alias vi-kick="NVIM_APPNAME=kickstart vi"

# alias vi-astro="NVIM_APPNAME=AstroNvim vi"
# function via { NVIM_APPNAME=AstroNvim vi "$@"; }

# nvims() {
# 	items=("default" "AstroNvim" "LazyVim" "KickStart" "NvChad")
# 	config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Switcher  " --height=~50% --layout=reverse --border --exit-0)
# 	if [[ -z $config ]]; then
# 		echo "Nothing selected"
# 		return 0
# 	elif [[ $config == "default" ]]; then
# 		config=""
# 	fi
# 	NVIM_APPNAME=$config vi "$@"
# }

# bind -x '"\C-]": "nvims"'

# 使用vi-astro作为默认编辑器
export EDITOR=vi
# export EDITOR="NVIM_APPNAME=AstroNvim vi"

# >>> tmux快捷键 >>>
# bind -x '"\C-[": "tmux"'
# <<< tmux快捷键 <<<

# fzf配置
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.config/fzf/myfzf.bash ] && source ~/.config/fzf/myfzf.bash

# forgit配置
[[ -s ~/.forgit/forgit.plugin.sh ]] && source ~/.forgit/forgit.plugin.sh
[[ -s ~/.forgit/completions/git-forgit.bash ]] && source ~/.forgit/completions/git-forgit.bash

# bat主题
# export BAT_THEME="gruvbox-dark"
# export BAT_THEME="OneHalfDark"
# export BAT_THEME="Monokai Extended"
# export BAT_THEME="Dracula"
# export BAT_THEME="Sublime Snazzy"

# >>> conda initialize >>>
# <<< conda initialize <<<
PATH=$PATH:~/.config/rofi/scripts

# MPD daemon start (if no other user instance exists)
# [ ! -s ~/.config/mpd/pid ] && systemctl --user start mpd
systemctl --user restart mpd

# 加载自定义shell函数
[ -f ~/.bash_func ] && source ~/.bash_func
