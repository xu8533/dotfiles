#!/usr/bin/bash
# fzf config
# export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
	--preview 'bat --color=always {}'
	--preview-window right:75%:hidden:wrap
	--bind '?:change-preview-window(right|hidden|)'
  "

# 搜索历史命令使用ctrl+r
# --bind 'ctrl-y:execute-silent(echo -n {2..} | xclip -selection clipboard'
# --bind 'ctrl-y:execute-silent(echo -n {2..} | xclip -selection clipboard)+abort'
export FZF_CTRL_R_OPTS="
    --preview 'echo {}' 
    --preview-window down:6:hidden:wrap 
    --bind '?:toggle-preview'
    --bind 'ctrl-y:execute-silent(echo -n {} | wl-copy -p)+abort'
    --color header:italic
    --header '请按CTRL-y将命令复制到剪切板'"

# 树形目录
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

# 这两个选项不能和preview一起工作
# --select-1
# --exit-0'"
# 更改触发键为两个逗号，默认为两个星号
export FZF_COMPLETION_TRIGGER=',,'

# 启用双边框
export FZF_COMPLETION_OPTS='
    --border=double
    --info=inline-right'

# fzf默认选项，启用预览功能，默认为隐藏模式，使用ctrl+/切换
# 预览程序为bat, bat的配置在~/.config/bat/config, 需要调整效果
# 修改该文件即可
# --preview 'bat --color=always {}'
# --preview 'fzf-preview.sh {}'
export FZF_DEFAULT_OPTS="
    --preview-window border-thinblock:right:75%:hidden:wrap
    --bind='ctrl-u:preview-page-up'
    --bind='ctrl-d:preview-page-down'
    --bind='ctrl-/:change-preview-window(right|hidden|)'
    --bind='?:toggle-preview'
	--bind='scroll-up:up+up,scroll-down:down+down' \
    --bind='preview-scroll-up:preview-up+preview-up' \
    --bind='preview-scroll-down:preview-down+preview-down' \
    --height=85% 
    --multi
    --layout=reverse
    --info=right
    --border=thinblock
    --prompt=' '
    --tabstop=4
    --padding=1
    --margin=1"

# fzf和tmux结合使用
# export FZF_TMUX=1
# export FZF_TMUX_OPTS='-p 80%,60%'

# fzf和forgit集成
export FORGIT_FZF_DEFAULT_OPTS="
  --exact
  --border
  --cycle
  --reverse
  --height '80%'
"

#############重写部分默认函数#######################################
# 使用fd替换find
_fzf_compgen_path() {
	fd --hidden --follow --exclude ".git" . "$1"
}
_fzf_compgen_dir() {
	fd --type d --hidden --follow --exclude ".git" . "$1"
}
# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should maje sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
	local command=$1
	shift

	case "$command" in
	cd) fzf --preview 'tree -C {} | head -200' "$@" ;;
	export | unset) fzf --preview "eval 'echo \$'{}" "$@" ;;
	ssh) fzf --preview 'dig {}' "$@" ;;
	*) fzf --preview 'bat {}' "$@" ;;
	esac
}

#############社区提供的一些常用函数################################
# fkill - 杀死进程- 只显示本账号可以kill的进程
fkill() {
	local pid
	if [ "$UID" != "0" ]; then
		pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
	else
		pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
	fi

	if [ "x$pid" != "x" ]; then
		echo $pid | xargs kill -${1:-9}
	fi
}

# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# tm() {
# 	[[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
# 	if [ $1 ]; then
# 		tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1")
# 		return
# 	fi
# 	session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) && tmux $change -t "$session" || echo "No sessions found."
# }

# fs [FUZZY PATTERN] - Select selected tmux session
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
# fs() {
# 	local session
# 	session=$(tmux list-sessions -F "#{session_name}" |
# 		fzf --query="$1" --select-1 --exit-0) &&
# 		tmux switch-client -t "$session"
# }
# ftpane - switch pane (@george-b)
# ftpane() {
# 	local panes current_window current_pane target target_window target_pane
# 	panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
# 	current_pane=$(tmux display-message -p '#I:#P')
# 	current_window=$(tmux display-message -p '#I')
#
# 	target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return
#
# 	target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
# 	target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)
#
# 	if [[ $current_window -eq $target_window ]]; then
# 		tmux select-pane -t ${target_window}.${target_pane}
# 	else
# 		tmux select-pane -t ${target_window}.${target_pane} &&
# 			tmux select-window -t $target_window
# 	fi
# }

# fman - 查看man手册
man-find() {
	f=$(fd . $MANPATH/man${1:-1} -t f -x echo {/.} | fzf) && man $f
}

fman() {
	man -k . | fzf -q "$1" --prompt='man> ' --preview $'
		echo {} | tr -d \'()\' | 
		awk \'{printf "%s ", $2} {print $1}\' | 
		xargs -r man | 
		col -bx | 
		bat -l man -p --color always
		' | tr -d '()' |
		awk '{printf "%s ", $2} {print $1}' |
		xargs -r man
}
# Get the colors in the opened man page itself
# export MANPAGER="sh -c 'col -bx | bat -l man -p --paging always'"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
	IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
	key=$(head -1 <<<"$out")
	file=$(head -2 <<<"$out" | tail -1)
	if [ -n "$file" ]; then
		[ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-emacs} "$file"
	fi
}

# fh - 重复历史命令
runcmd() { perl -e 'ioctl STDOUT, 0x5412, $_ for split //, <>'; }
fh() {
	([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -re 's/^\s*[0-9]+\s*//' | runcmd
}

# fhe - 重复历史命令(允许修改命令)
writecmd() { perl -e 'ioctl STDOUT, 0x5412, $_ for split //, do{ chomp($_ = <>); $_ }'; }
fhe() {
	([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -re 's/^\s*[0-9]+\s*//' | writecmd
}

# git集成
# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
fbr() {
	local branches branch
	branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
		branch=$(echo "$branches" |
			fzf-tmux -d $((2 + $(wc -l <<<"$branches"))) +m) &&
		git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
# fco - checkout git branch/tag
fco() {
	local tags branches target
	branches=$(
		git --no-pager branch --all \
			--format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" |
			sed '/^$/d'
	) || return
	tags=$(
		git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}'
	) || return
	target=$(
		(
			echo "$branches"
			echo "$tags"
		) |
			fzf --no-hscroll --no-multi -n 2 \
				--ansi
	) || return
	git checkout $(awk '{print $2}' <<<"$target")
}
# fco_preview - checkout git branch/tag, with a preview showing the commits between the tag/branch and HEAD
fco_preview() {
	local tags branches target
	branches=$(
		git --no-pager branch --all \
			--format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" |
			sed '/^$/d'
	) || return
	tags=$(
		git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}'
	) || return
	target=$(
		(
			echo "$branches"
			echo "$tags"
		) |
			fzf --no-hscroll --no-multi -n 2 \
				--ansi --preview="git --no-pager log -150 --pretty=format:%s '..{2}'"
	) || return
	git checkout $(awk '{print $2}' <<<"$target")
}
# fcoc - checkout git commit
fcoc() {
	local commits commit
	commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
		commit=$(echo "$commits" | fzf --tac +s +m -e) &&
		git checkout $(echo "$commit" | sed "s/ .*//")
}
# fshow - git commit browser
fshow() {
	git log --graph --color=always \
		--format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
		fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
			--bind "ctrl-m:execute:
              (grep -o '[a-f0-9]\{7\}' | head -1 |
              xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
              {}
              FZF-EOF"
}

alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"'
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"
# fcoc_preview - checkout git commit with previews
fcoc_preview() {
	local commit
	commit=$(glNoGraph |
		fzf --no-sort --reverse --tiebreak=index --no-multi \
			--ansi --preview="$_viewGitLogLine") &&
		git checkout $(echo "$commit" | sed "s/ .*//")
}
# fshow_preview - git commit browser with previews
fshow_preview() {
	glNoGraph |
		fzf --no-sort --reverse --tiebreak=index --no-multi \
			--ansi --preview="$_viewGitLogLine" \
			--header "enter to view, alt-y to copy hash" \
			--bind "enter:execute:$_viewGitLogLine   | less -R" \
			--bind "alt-y:execute:$_gitLogLineToHash | xclip"
}
# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
fstash() {
	local out q k sha
	while out=$(
		git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
			fzf --ansi --no-sort --query="$q" --print-query \
				--expect=ctrl-d,ctrl-b
	); do
		mapfile -t out <<<"$out"
		q="${out[0]}"
		k="${out[1]}"
		sha="${out[-1]}"
		sha="${sha%% *}"
		[[ -z "$sha" ]] && continue
		if [[ "$k" == 'ctrl-d' ]]; then
			git diff $sha
		elif [[ "$k" == 'ctrl-b' ]]; then
			git stash branch "stash-$sha" $sha
			break
		else
			git stash show -p $sha
		fi
	done
}
# gh-watch -- watch the current actions
gh-watch() {
	gh run list \
		--branch $(git rev-parse --abbrev-ref HEAD) \
		--json status,name,databaseId |
		jq -r '.[] | select(.status != "completed") | (.databaseId | tostring) + "\t" + (.name)' |
		fzf -1 -0 | awk '{print $1}' | xargs gh run watch
}

# conda集成
fzf-conda-activate() {
	choice=(
		$"
			conda env list |
				sed 's/\*/ /;1,2d' |
				xargs -I {} bash -c '
                name_path=( {} );
                py_version=( $(${name_path[1]}/bin/python --version) );
                echo ${name_path[0]} ${py_version[1]} ${name_path[1]} 
                ' |
				column -t |
				fzf --layout=reverse \
					--info=inline \
					--border=rounded \
					--height=40 \
					--preview-window="right:30%" \
					--preview-label=" conda tree leaves " \
					--preview=$'
                    conda tree -p {3} leaves |
                    perl -F\'[^\\w-_]\' -lae \'print for grep /./, @F;\' |
                    sort
                '
		"
	)
	[[ -n "$choice" ]] && conda activate "$choice"
}

# fzf版本cd命令
cd() {
	# 	builtin cd "$@" ||
	# 		return
	# fi
	# 修复直接使用cd命令不加参数时还是跳出目录选择菜单
	if [[ "$#" != 0 ]]; then
		builtin cd "$@" || return
	elif [[ "$#" == 0 ]]; then
		builtin cd
		return
	fi
	while true; do
		local lsd=$(echo ".." && ls -p | grep '/$' | sed 's;/$;;')
		local dir="$(printf '%s\n' "${lsd[@]}" |
			fzf --reverse --preview '
                __cd_nxt="$(echo {})";
                __cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
                echo $__cd_path;
                echo;
                ls -p --color=always "${__cd_path}";
        ')"
		[[ ${#dir} != 0 ]] || return 0
		builtin cd "$dir" &>/dev/null || return
	done
}

# fzf和autojump集成
j() {
	local preview_cmd="ls {2..}"
	if command -v exa &>/dev/null; then
		preview_cmd="exa -l {2}"
	fi

	if [[ $# -eq 0 ]]; then
		cd "$(autojump -s |
			sort -k1gr |
			awk -F : '$1 ~ /[0-9]/ && $2 ~ /^\s*\// {print $1 $2}' |
			fzf --height 40% --reverse --inline-info --preview "$preview_cmd" --preview-window down:50% |
			cut -d$'\t' -f2- |
			sed 's/^\s*//')" || return
	else
		cd $(autojump "$@")
	fi
}

# fzf主题
# Paper color
export FZF_DEFAULT_OPTS='
	--color=fg:#4d4d4c,bg:#eeeeee,hl:#d7005f
	--color=fg+:#fd3f7f,bg+:#eeeee8,hl+:#007175
	--color=info:#4271ae,prompt:#8959a8,pointer:#d7005f
	--color=marker:#4271ae,spinner:#4271ae,header:#4271ae
	--color=preview-fg:#f4b3c2,preview-bg:#326663
	--color=query:#00aaee'
#

# SpaceCamp
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#  --color=fg:#dedede,bg:#121212,hl:#666666
#  --color=fg+:#eeeeee,bg+:#282828,hl+:#cf73e6
#  --color=info:#cf73e6,prompt:#FF0000,pointer:#cf73e6
#  --color=marker:#f0d50c,spinner:#cf73e6,header:#91aadf
#  --color=query:#b7c741
#  --color=preview-bg:#223345,border:#778899'
# --color=query:#2874af

# Dracula
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# 	--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
# 	--color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
# 	--color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
# 	--color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# web color
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# --color=fg:#d0d0d0,bg:#121212,hl:#5f87af
# 	--color=fg+:#d0d0d0,bg+:#262626,hl+:#5fd7ff
# 	--color=info:#afaf87,prompt:#d7005f,pointer:#af5fff
# 	--color=marker:#87ff00,spinner:#af5fff,header:#87afaf'

#sonokai:
#sonokai-default:
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --color=fg:#e1e3e4,bg:#2b2d3a,hl:#7e8294
# 	--color=fg+:#e1e3e4,bg+:#333648,hl+:#fb617e
# 	--color=info:#fb617e,prompt:#fb617e,pointer:#fb617e
# 	--color=marker:#fb617e,spinner:#bb97ee,header:#7e8294
# 	--color=border:#7e8294,preview-bg:#363a4e'

# sonokai-andromeda:
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# 	--color=fg:#e1e3e4,bg:#2b2d3a,hl:#9ed06c
# 	--color=fg+:#e1e3e4,bg+:#333648,hl+:#9ed06c
# 	--color=info:#edc763,prompt:#fb617e,pointer:#6dcae8
# 	--color=marker:#6dcae8,spinner:#edc763,header:#6dcae8
#   --color=border:#7e8294'
#
# sonokai-atlantis:
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --color=fg:#e1e3e4,bg:#2a2f38,hl:#9dd274
# 	--color=fg+:#e1e3e4,bg+:#333846,hl+:#9dd274
# 	--color=info:#eacb64,prompt:#ff6578,pointer:#72cce8
# 	--color=marker:#72cce8,spinner:#eacb64,header:#72cce8
#   --color=border:#828a9a'
#
# sonokai-shusia:
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --color=fg:#e3e1e4,bg:#2d2a2e,hl:#9ecd6f
# 	--color=fg+:#e3e1e4,bg+:#37343a,hl+:#9ecd6f
# 	--color=info:#e5c463,prompt:#f85e84,pointer:#7accd7
# 	--color=marker:#7accd7,spinner:#e5c463,header:#7accd7
#   --color=border:#848089'
#
# sonokai-maia:
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --color=fg:#e1e2e3,bg:#273136,hl:#9cd57b
# 	--color=fg+:#e1e2e3,bg+:#313b42,hl+:#9cd57b
# 	--color=info:#e3d367,prompt:#f76c7c,pointer:#78cee9
# 	--color=marker:#78cee9,spinner:#e3d367,header:#78cee9
#   --color=border:#82878b'
#
# sonokai-espresso:
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --color=fg:#e4e3e1,bg:#312c2b,hl:#a6cd77
# 	--color=fg+:#e4e3e1,bg+:#393230,hl+:#a6cd77
# 	--color=info:#f0c66f,prompt:#f86882,pointer:#81d0c9
# 	--color=marker:#81d0c9,spinner:#f0c66f,header:#81d0c9
#   --color=border:#90817b'
#
# everforest-dark:
# everforest-soft:
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --color=fg:#d3c6aa,bg:#333c43,hl:#a7c080
# 	--color=fg+:#d3c6aa,bg+:#3a464c,hl+:#83c092
# 	--color=info:#83c092,prompt:#e69875,pointer:#7fbbb3
# 	--color=marker:#dbbc7f,spinner:#dbbc7f,header:#859289
#   --color=border:#859289'
#
# everforest-medium:
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --color=fg:#d3c6aa,bg:#2d353b,hl:#a7c080
# 	--color=fg+:#d3c6aa,bg+:#343f44,hl+:#83c092
# 	--color=info:#83c092,prompt:#e69875,pointer:#7fbbb3
# 	--color=marker:#dbbc7f,spinner:#dbbc7f,header:#859289
#   --color=border:#859289'
#
# everforest-hard:
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --color=fg:#d3c6aa,bg:#272e33,hl:#a7c080
# 	--color=fg+:#d3c6aa,bg+:#2e383c,hl+:#83c092
# 	--color=info:#83c092,prompt:#e69875,pointer:#7fbbb3
# 	--color=marker:#dbbc7f,spinner:#dbbc7f,header:#859289
#   --color=border:#859289'
#
# everforest-light:
# everforest-soft:
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --color=fg:#5c6a72,bg:#f3ead3,hl:#8da101
# 	--color=fg+:#5c6a72,bg+:#eae4ca,hl+:#35a77c
# 	--color=info:#35a77c,prompt:#f57d26,pointer:#3a94c5
# 	--color=marker:#dfa000,spinner:#dfa000,header:#939f91
#   --color=border:#939f91'

# everforest-medium:
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --color=fg:#5c6a72,bg:#fdf6e3,hl:#8da101
# 	--color=fg+:#5c6a72,bg+:#f4f0d9,hl+:#35a77c
# 	--color=info:#35a77c,prompt:#f57d26,pointer:#3a94c5
# 	--color=marker:#dfa000,spinner:#dfa000,header:#939f91
#   --color=border:#939f91'

# everforest-hard:
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --color=fg:#5c6a72,bg:#fffbef,hl:#8da101
# 	--color=fg+:#5c6a72,bg+:#f8f5e4,hl+:#35a77c
# 	--color=info:#35a77c,prompt:#f57d26,pointer:#3a94c5
# 	--color=marker:#dfa000,spinner:#dfa000,header:#939f91
#   --color=border:#939f91'

# Catppuccin-mocha:
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# 	--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
# 	--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
# 	--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8'

# rose-pine-dawn:
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# 	--color=fg:#797593,bg:#faf4ed,hl:#d7827e
# 	--color=fg+:#575279,bg+:#f2e9e1,hl+:#d7827e
# 	--color=border:#dfdad9,header:#286983,gutter:#faf4ed
# 	--color=spinner:#ea9d34,info:#56949f,separator:#dfdad9
# 	--color=pointer:#907aa9,marker:#b4637a,prompt:#797593'
#
# Ayu Mirage
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# 	--color=fg:#cbccc6,bg:#1f2430,hl:#707a8c
# 	--color=fg+:#707a8c,bg+:#191e2a,hl+:#ffcc66
# 	--color=info:#73d0ff,prompt:#707a8c,pointer:#cbccc6
# 	--color=marker:#73d0ff,spinner:#73d0ff,header:#d4bfff'
#
# tokyonight_day
# export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
# --color=fg:#3760bf,bg:#e1e2e7,hl:#b15c00 \
# --color=fg+:#3760bf,bg+:#c4c8da,hl+:#b15c00 \
# --color=info:#2e7de9,prompt:#007197,pointer:#007197 \
# --color=marker:#587539,spinner:#587539,header:#587539"
#
# tokyonight_moon
# export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
# --color=fg:#c8d3f5,bg:#222436,hl:#ff966c \
# --color=fg+:#c8d3f5,bg+:#2f334d,hl+:#ff966c \
# --color=info:#82aaff,prompt:#86e1fc,pointer:#86e1fc \
# --color=marker:#c3e88d,spinner:#c3e88d,header:#c3e88d"
#
# tokyonight_night
# export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
# --color=fg:#c0caf5,bg:#1a1b26,hl:#ff9e64 \
# --color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 \
# --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff \
# --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"
#
# tokyonight_storm
# export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
# --color=fg:#c0caf5,bg:#24283b,hl:#ff9e64 \
# --color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 \
# --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff \
# --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"
