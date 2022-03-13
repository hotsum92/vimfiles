"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" backup

set noswapfile
set nobackup
set viminfo=
set noundofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" behavior

syntax on
set nospell
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

