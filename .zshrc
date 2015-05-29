source ~/project/Dev/share/etc/mf-dev.zshrc
source ~/git-completion.bash
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
alias tmux="/usr/local/app/tmux/bin/tmux -2"
alias vim="$HOME/local/bin/vim"

# -------------------------------------------------------------------------
# プロンクト
#
# -------------------------------------------------------------------------

autoload colors
colors
PROMPT="%B%{${fg[yellow]}%}[zsh %n@%m] %{${reset_color}%}%b%(#.#.$) "
RPROMPT="%{${fg[red]}%}[%39<...<%/] %{${reset_color}%}"
bindkey -e


# -------------------------------------------------------------------------
# 複数ファイルをmv
#
# -------------------------------------------------------------------------
autoload -Uz zmv
alias zmv='noglob zmv -W'

# -------------------------------------------------------------------------
# 履歴
#
# -------------------------------------------------------------------------

# 履歴をファイルに保存する
HISTFILE=$HOME/.zsh_history

# メモリ内の履歴の数
HISTSIZE=10000

# 保存される履歴の数
SAVEHIST=10000

# 履歴ファイルに時刻を記録
setopt extended_history

# 全履歴の一覧を出力する
function history-all { history -E 1 }

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups

# コマンド行の余計な空白を詰めて履歴に入れる
setopt hist_reduce_blanks
# -------------------------------------------------------------------------
# 補完
#
# -------------------------------------------------------------------------

# 基本
autoload -U compinit
compinit

# 補完候補の大文字小文字の違いを無視
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補を←↓↑→で
zstyle ':completion:*:default' menu select true

# 指定したコマンド名がなく、ディレクトリ名と一致した場合 cd する
setopt auto_cd

# 補完候補が複数ある時に、一覧表示する
setopt auto_list

# auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示
setopt list_types

# HOST名の補完
_cache_hosts=(`perl -ne  'if (/^([\w.-]+)/) {print "$1\n"}' ~/.ssh/known_hosts`)



# -------------------------------------------------------------------------
# その他
#
# -------------------------------------------------------------------------

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# 改行なくても表示
unsetopt promptcr

# Ctrl + D でログアウトしない
setopt ignore_eof

# Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
setopt NO_flow_control

# コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments

# シェルが終了しても裏ジョブに HUP シグナルを送らないようにする
setopt NO_hup
# -------------------------------------------------------------------------
# lsに色をつける
#
# -------------------------------------------------------------------------
alias ls='ls --color'
eval `dircolors -b ~/.dir_colors`


# -------------------------------------------------------------------------
# alias
#
# -------------------------------------------------------------------------

alias tmux="/usr/local/app/tmux/bin/tmux -2"
alias vi="vim"
alias ll="ls -l"
alias lla="ls -la"
alias lltr="ls -ltr"
alias rs="restart-servers"

