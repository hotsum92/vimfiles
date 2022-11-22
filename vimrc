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
" path

let $PATH .= ';C:\Program Files\Git\usr\bin'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" behavior

syntax on
set spell
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

set clipboard=unnamed,autoselect

set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp
set fileformats=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" visual

set number
set statusline=%{&fileencoding}\ %{&fileformat}\ %Y\ ASCII=\%3b\ HEX=\%2B\ [%l/%L/%c]%<%=%F%m%r%h%w
set laststatus=2
set nowrap
set list
set listchars=tab:^\ ,trail:~

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keymap

nnoremap <Up>    :tabclose<CR>
nnoremap <Down>  :tabnew<CR>
nnoremap <Left>  :tabprevious<CR>
nnoremap <Right> :tabnext<CR>

nnoremap <Esc><Esc> :nohlsearch<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" default plug

packadd! matchit


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plug

call plug#begin('~/.vim/plugged')

Plug 't9md/vim-quickhl'
Plug 'mbbill/undotree'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'vim-scripts/zoom.vim'
Plug 'kshenoy/vim-signature'
Plug 'Quramy/tsuquyomi'
Plug 'qpkorr/vim-renamer'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" t9md/vim-quickhl

nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mbbill/undotree

nnoremap <F5> :UndotreeToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion/vim-easymotion

"Disable default mappings
let g:EasyMotion_do_mapping = 0

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Jump to first match with enter & space
let g:EasyMotion_enter_jump_first = 1

map / <Plug>(easymotion-sn)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" alvan/vim-closetag

let g:closetag_filenames = '*.html,*.xhtml,*.tsx'

