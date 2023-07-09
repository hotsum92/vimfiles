# vim config

## ubuntu

### vim 9のinstall

```
$ sudo add-apt-repository ppa:jonathonf/vim
$ sudo apt install vim
```

### version確認

クリップボードのサポートがない

```
$ vim --version
VIM - Vi IMproved 9.0 (2022 Jun 28, compiled May 10 2022 08:40:37)
Included patches: 1-749
Modified by team+vim@tracker.debian.org
Compiled by team+vim@tracker.debian.org
Huge version without GUI.  Features included (+) or not (-):
+acl               +file_in_path      +mouse_urxvt       -tag_any_white
+arabic            +find_in_path      +mouse_xterm       -tcl
+autocmd           +float             +multi_byte        +termguicolors
+autochdir         +folding           +multi_lang        +terminal
-autoservername    -footer            -mzscheme          +terminfo
-balloon_eval      +fork()            +netbeans_intg     +termresponse
+balloon_eval_term +gettext           +num64             +textobjects
-browse            -hangul_input      +packages          +textprop
++builtin_terms    +iconv             +path_extra        +timers
+byte_offset       +insert_expand     -perl              +title
+channel           +ipv6              +persistent_undo   -toolbar
+cindent           +job               +popupwin          +user_commands
-clientserver      +jumplist          +postscript        +vartabs
-clipboard         +keymap            +printer           +vertsplit
+cmdline_compl     +lambda            +profile           +vim9script
+cmdline_hist      +langmap           -python            +viminfo
+cmdline_info      +libcall           +python3           +virtualedit
+comments          +linebreak         +quickfix          +visual
+conceal           +lispindent        +reltime           +visualextra
+cryptv            +listcmds          +rightleft         +vreplace
+cscope            +localmap          -ruby              +wildignore
+cursorbind        -lua               +scrollbind        +wildmenu
+cursorshape       +menu              +signs             +windows
+dialog_con        +mksession         +smartindent       +writebackup
+diff              +modify_fname      +sodium            -X11
+digraphs          +mouse             -sound             -xfontset
-dnd               -mouseshape        +spell             -xim
-ebcdic            +mouse_dec         +startuptime       -xpm
+emacs_tags        +mouse_gpm         +statusline        -xsmp
+eval              -mouse_jsbterm     -sun_workshop      -xterm_clipboard
+ex_extra          +mouse_netterm     +syntax            -xterm_save
+extra_search      +mouse_sgr         +tag_binary        
-farsi             -mouse_sysmouse    -tag_old_static    
   system vimrc file: "$VIM/vimrc"
     user vimrc file: "$HOME/.vimrc"
 2nd user vimrc file: "~/.vim/vimrc"
      user exrc file: "$HOME/.exrc"
       defaults file: "$VIMRUNTIME/defaults.vim"
  fall-back for $VIM: "/usr/share/vim"
Compilation: gcc -c -I. -Iproto -DHAVE_CONFIG_H -Wdate-time -g -O2 -fdebug-prefix-map=/build/vim-s9rYnH/vim-9.0.0749=. -fstack-protector-strong -Wformat -Werror=format-security -D_REENTRANT -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1 
Linking: gcc -Wl,-Bsymbolic-functions -Wl,-z,relro -Wl,-z,now -Wl,--as-needed -o vim -lm -ltinfo -lselinux -lsodium -lrt -lacl -lattr -lgpm -ldl -L/usr/lib/python3.8/config-3.8-x86_64-linux-gnu -lpython3.8 -lcrypt -lpthread -ldl -lutil -lm -lm 
```

### node install

copilot pluginがnodejsを16以上のバージョンを必要とするため

```
$ curl -fsSL https://deb.nodesource.com/setup_16.x -o setup.sh
$ sudo bash ./setup.sh
$ sudo apt update
$ sudo apt install nodejs
$ node --version
v16.20.1
$ npm --version
8.19.4
```

### config

```
$ git clone git@github.com:hotsum92/vimfiles.git ~/.vim
```

### install plugin

```
$ vim
:PlugInstall
:Copilot setup
```

## ref

[install vim 9](https://itsfoss.com/install-latest-vim-ubuntu/)
[node install](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04-ja)

