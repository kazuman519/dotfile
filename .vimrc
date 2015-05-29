" -------------------------------------------------------------------------
" 日本語の設定
"
" -------------------------------------------------------------------------

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932
set fileformats=unix,dos,mac
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:<
set incsearch
set hlsearch
set nowrap
set showmatch
set ambiwidth=double
set hidden
set history=2000
set autoindent
set backspace=indent,eol,start

" -------------------------------------------------------------------------
" 環境
"
" -------------------------------------------------------------------------

set runtimepath+=~/local/etc/vim
set viminfo+=n~/local/var/cache/viminfo


" -------------------------------------------------------------------------
" 表示
"
" -------------------------------------------------------------------------

" 色の設定
set t_Co=256
colorscheme desert256
syntax on

" Perlのシンタックスがちょっとキモイので。
let perl_no_extended_vars=1

" Tab文字を画面上の見た目で何文字幅にするか設定
set tabstop=2

" 自動で挿入されるタブの幅
set shiftwidth=2

" タブをスペースに変換
set expandtab

" ステータス行は2行(ファイル名が表示される)
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P_

" 入力中のコマンドをステータスに表示
set showcmd

"Tab、行末の半角スペースを明示的に表示する。
set list
set listchars=tab:>-,trail:_


" -------------------------------------------------------------------------
" 編集
"
" -------------------------------------------------------------------------

    " 自動インデント
    set autoindent

    " コメントの時のインデントは勘弁な
    autocmd FileType * setlocal formatoptions-=ro


" -------------------------------------------------------------------------
" 検索
"
" -------------------------------------------------------------------------

    " インクリメンタルサーチ
    set incsearch

    " 検索時に大文字小文字を区別しない
    set ignorecase

    " ただし、大文字が含まれている場合は区別
    set smartcase


" -------------------------------------------------------------------------
" Perlの構文チェックを ,make で出来るように設定
"
" -------------------------------------------------------------------------
    setlocal makeprg=perl\ -wc\ %
    setlocal errorformat=%m\ at\ %f\ line\ %l%.
    map ,make :w<ENTER> :make<ENTER>


" -------------------------------------------------------------------------
" 入力補完
"
" -------------------------------------------------------------------------
inoremap ,date <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR>
inoremap ,use use strict;<CR>use utf8;<CR>
inoremap ,bi binmode STDOUT, ":utf8";
inoremap ,dd use Data::Dumper;<CR>say Dumper
inoremap ..c .. code-block:: console

inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap < <><LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

iabbrev $$  # =========================================================================
iabbrev ##! # -------------------------------------------------------------------------
iabbrev !!  ===========================================================================
iabbrev @@  ---------------------------------------------------------------------------


" -------------------------------------------------------------------------
" ハイライト
"
" -------------------------------------------------------------------------
au BufRead,BufNewFile *.tx    set filetype=html


" -------------------------------------------------------------------------
" ツリー表示
"
" -------------------------------------------------------------------------
  " netrwは常にtree view
  let g:netrw_liststyle = 3


" -------------------------------------------------------------------------
" プラグイン管理 Vundle
"
" -------------------------------------------------------------------------
"おまじない
set nocompatible
filetype off
set rtp+=~/.vim/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nathanaelkane/vim-indent-guides'
syntax enable


" -------------------------------------------------------------------------
" indent-guidesの設定
"
" -------------------------------------------------------------------------
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1
