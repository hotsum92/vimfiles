"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" execute command

function Execr() range
  if &filetype == 'go'
    '<,'>terminal yaegi
  elseif &filetype == 'sql'
    if executable('./db.sh')
      '<,'>terminal ./db.sh
    else
      '<,'>terminal mysql -u root
    endif
  elseif &filetype == 'python'
    if executable('./python.sh')
      '<,'>terminal ./python.sh
    else
      '<,'>terminal python -
    endif
  else
    if executable('./bash.sh')
      '<,'>terminal ./bash.sh
    else
      '<,'>terminal bash
    endif
  endif
endfunction

function Exec() range
  if &filetype == 'go'
    .!yaegi
  elseif &filetype == 'sql'
    if executable('./db.sh')
      .!./db.sh
    else
      .!mysql -u root
    endif
  elseif &filetype == 'python'
    if executable('./python.sh')
      .!./python.sh
    else
      .!python -
    endif
  else
    if executable('./bash.sh')
      .!./bash.sh
    else
      .!bash
    endif
  endif
endfunction

vnoremap <CR> :call Execr()<CR>
nnoremap <Space><CR> :call Exec()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set tabstop, softtabstop and shiftwidth to the same value

command! -nargs=* Stab call Stab()

function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts 
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    end
  finally
    echohl None
  endtry
endfunction

command! CopyPath :let @+=expand('%:p')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" backup

if !isdirectory($HOME."/.vim-backup")
  call mkdir($HOME."/.vim-backup")
endif

if !isdirectory($HOME."/.vim-backup/backup")
  call mkdir($HOME."/.vim-backup/backup")
endif

if !isdirectory($HOME."/.vim-backup/directory")
  call mkdir($HOME."/.vim-backup/directory")
endif

if !isdirectory($HOME."/.vim-backup/undo")
  call mkdir($HOME."/.vim-backup/undo")
endif

set backupdir=$HOME/.vim-backup/backup
set directory=$HOME/.vim-backup/directory
set undodir=$HOME/.vim-backup/undo

set undofile
set history=1000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" grep

autocmd QuickFixCmdPost *grep* cwindow

set grepprg=git\ grep\ -I\ --line-number

" CHIPS: how to use list.txt
" git grep -n something > tmp.txt
" :Qfix cat tmp.txt
command -nargs=+ Qfix :cexpr system("<args>") | cwindow


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" complete

"set complete=.,w,b,t,i " default
set complete=.,w,b,t

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" behavior

" :terminal to use shell
"set shell=/opt/homebrew/bin/bash


if has('gui_running')
  set spell
else
  set nospell
endif

" avoid overlap multibyte characters
set ambiwidth=double

syntax on
set path+=**
set nrformats=alpha,hex,bin
set matchpairs+=<:>
set nohidden
set autoread
set shellslash
set wildmenu
set formatoptions-=cro
set backspace=indent,eol,start

set incsearch
set hlsearch
set ignorecase
set smartcase
set nowrapscan

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp
set fileformats=unix,dos,mac

set belloff=all

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" visual

set number
set statusline=%{&fileencoding}\ %{&fileformat}\ %Y\ ASCII=\%3b\ HEX=\%2B\ [%l/%L/%c]%<%=%F%m%r%h%w
set laststatus=2
set nowrap
set list
set listchars=tab:^\ ,trail:~
set showcmd

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable mouse

set mouse=a

nmap <ScrollWheelUp> <nop>
nmap <S-ScrollWheelUp> <nop>
nmap <C-ScrollWheelUp> <nop>
nmap <ScrollWheelDown> <nop>
nmap <S-ScrollWheelDown> <nop>
nmap <C-ScrollWheelDown> <nop>
nmap <ScrollWheelLeft> <nop>
nmap <S-ScrollWheelLeft> <nop>
nmap <C-ScrollWheelLeft> <nop>
nmap <ScrollWheelRight> <nop>
nmap <S-ScrollWheelRight> <nop>
nmap <C-ScrollWheelRight> <nop>

imap <ScrollWheelUp> <nop>
imap <S-ScrollWheelUp> <nop>
imap <C-ScrollWheelUp> <nop>
imap <ScrollWheelDown> <nop>
imap <S-ScrollWheelDown> <nop>
imap <C-ScrollWheelDown> <nop>
imap <ScrollWheelLeft> <nop>
imap <S-ScrollWheelLeft> <nop>
imap <C-ScrollWheelLeft> <nop>
imap <ScrollWheelRight> <nop>
imap <S-ScrollWheelRight> <nop>
imap <C-ScrollWheelRight> <nop>

vmap <ScrollWheelUp> <nop>
vmap <S-ScrollWheelUp> <nop>
vmap <C-ScrollWheelUp> <nop>
vmap <ScrollWheelDown> <nop>
vmap <S-ScrollWheelDown> <nop>
vmap <C-ScrollWheelDown> <nop>
vmap <ScrollWheelLeft> <nop>
vmap <S-ScrollWheelLeft> <nop>
vmap <C-ScrollWheelLeft> <nop>
vmap <ScrollWheelRight> <nop>
vmap <S-ScrollWheelRight> <nop>
vmap <C-ScrollWheelRight> <nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keymap

"nnoremap <Up>    :tabclose<CR>
"nnoremap <Down>  :tabnew<CR>
nnoremap <Left>  :tabprevious<CR>
nnoremap <Right> :tabnext<CR>
nnoremap <S-Left>  :bprev<CR>
nnoremap <S-Right> :bnext<CR>

nnoremap <Esc><Esc> :nohlsearch<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" iabbrev

"augroup sql
"  autocmd FileType sql iabbrev <buffer> select SELECT
"  autocmd FileType sql iabbrev <buffer> from FROM
"  autocmd FileType sql iabbrev <buffer> where WHERE
"  autocmd FileType sql iabbrev <buffer> order ORDER
"  autocmd FileType sql iabbrev <buffer> by BY
"augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" default plug

packadd! matchit

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plug

call plug#begin('~/.vim/plugged')

Plug 't9md/vim-quickhl'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag'
Plug 'Quramy/tsuquyomi'
Plug 'github/copilot.vim'
Plug 'preservim/vim-indent-guides'
Plug 'fatih/vim-go'
Plug 'nelstrom/vim-visual-star-search'
Plug 'Asheq/close-buffers.vim'
Plug 'tpope/vim-dotenv'
Plug 'jsborjesson/vim-uppercase-sql'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
"Plug 'cohama/lexima.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" t9md/vim-quickhl

nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion/vim-easymotion

"Disable default mappings
let g:EasyMotion_do_mapping = 0

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Jump to first match with enter & space
let g:EasyMotion_enter_jump_first = 1

map / <Plug>(easymotion-sn)

" case sensitive
nnoremap <Space>/ /\C
nnoremap <Space>? ?\C

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Space>l <Plug>(easymotion-bd-jk)
nmap <Space>l <Plug>(easymotion-overwin-line)

" Move to word
map  <Space>w <Plug>(easymotion-bd-w)
nmap <Space>w <Plug>(easymotion-overwin-w)

"map  <Space>f <Plug>(easymotion-bd-f)
"nmap <Space>f <Plug>(easymotion-overwin-f)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" junegunn/vim-easy-align

" :LiveEasyAlign

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" surround

" surround by key /(47)
let g:surround_47 = "/* \r */"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tpope/vim-commentary

" gcc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quramy/tsuquyomi

let g:tsuquyomi_disable_default_mappings = 1
autocmd FileType typescript nnoremap <C-]> :TsuquyomiDefinition<CR>
autocmd FileType typescriptreact nnoremap <C-]> :TsuquyomiDefinition<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" alvan/vim-closetag

let g:closetag_filenames = '*.html,*.xhtml,*.tsx'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" copilot.vim

let g:copilot_filetypes = {
    \ '*': v:true,
    \ 'gitcommit': v:true,
    \ 'markdown': v:true,
    \ 'yaml': v:true
    \ }

autocmd BufReadPre *
     \ let f=getfsize(expand("<afile>"))
     \ | if f > 100000 || f == -2
     \ | let b:copilot_enabled = v:false
     \ | endif

imap <C-j> <Plug>(copilot-next)
imap <C-k> <Plug>(copilot-previous)
imap <C-c> <Plug>(copilot-dismiss)
nnoremap <Space>j :Copilot panel<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent-guides

let g:indent_guides_enable_on_vim_startup = 1

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf

set rtp+=~/git/fzf
