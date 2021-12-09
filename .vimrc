autocmd InsertEnter * se cul
autocmd InsertLeave * se nocul
"set t_Co=512
filetype on
filetype plugin on
filetype plugin indent on
set t_Co=256
set ai!
set ambiwidth=double
set autoread
"set backspace=8
set nobackup
set cin
set cindent
set cmdheight=2 
set cursorline
set encoding=utf-8
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,big5,euc-jp,euc-kr,latin1
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set foldenable
set foldmethod=indent
"set foldmethod=syntax
set foldcolumn=0
"set foldlevel=3
"set foldlevelstart=99
set guifont=Courier_New:h10:cANSI
set hidden
set history=1000
set ignorecase
set incsearch
set magic
set nobackup
set nocompatible
set nocp
set novisualbell
set nowrap
set nohls
set nu
set ruler
set showcmd
set showmatch
set sm
set smartindent
"set smarttab
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set termencoding=utf-8
set tabstop=4
set expandtab
set autoindent
set softtabstop=4
set writebackup
syntax enable
syntax on
syntax manual
 
autocmd BufRead * set hlsearch
autocmd BufRead *.drc           set syntax=java
autocmd BufRead *.lvs           set syntax=java
autocmd BufRead *.inc           set syntax=java
autocmd BufRead *.sum           set syntax=java
autocmd BufRead *run.log        set syntax=java
autocmd BufRead *.tvf           set syntax=tcl
autocmd BufRead *.tcl           set syntax=tcl
autocmd BufRead *.tk            set syntax=tcl
autocmd BufRead *.perc          set syntax=java
autocmd BufRead *.vcell         set syntax=tcl
autocmd BufRead *bash*,*sh*     set syntax=sh
autocmd BufRead *csh*           set syntax=csh
autocmd BufRead *vim*           set syntax=vim
autocmd BufRead *.cdl*          set syntax=asm68k
autocmd BufRead *.perl,*.pl     set syntax=perl
autocmd BufRead *.txt           set syntax=txt
autocmd BufRead *.map           set syntax=maple
autocmd BufRead *.c,*.cpp       set syntax=cpp | colorscheme slate
autocmd BufRead *.md            set syntax=markdown
autocmd BufRead *.html,*.htm    set syntax=html
autocmd BufRead *.py            set syntax=python
 
set mouse-=a
set clipboard+=unnamed
set iskeyword+=_,$,@,%,#,-,+
set wildmenu
set report=0
 
"colorscheme elflord
colorscheme ron
"colorscheme murphy
"colorscheme koehler
"colorscheme molokaii
" torte darkblue

nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
nmap <F1> :colorscheme ron <CR>
nmap <F2> :colorscheme industry<CR>
nmap <F3> :set syntax=sh <CR>
nmap <F4> :set syntax=csh <CR>
nmap <F5> :set syntax=tcl <CR>
nmap <F6> :set syntax=markdown <CR>
nmap <F7> :set syntax=perl <CR>
nmap <F8> :set syntax=python <CR>
nmap <F9> :set syntax=java <CR>
nmap <C-F10> :vsp <CR>
nmap <F12> :vertical resize +1 <CR>
nmap <C-F12> :resize +1 <CR>
nmap <M-Down> :bn <CR>
nmap <M-Up> :bp <CR>

if (has("gui_running"))
    "colorscheme monokai
    "colorscheme jellybeans
    colorscheme industry
    "set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
    set guifont=DejaVu\ LGC\ Sans\ Mono\ 11
    set mouse=a
    cterm=none gulbg=#2F2F2F
    hi cursorline
    hi cursorcoLumn cterm=none guibg=#3F3F3F
    set cursorline
    set cursorcolum.
    set Lines=40 columns=160
endif

if &diff
    "colorscheme monokai
    "colorscheme jellybeans
    "colorscheme hybrid
    set diffopt+=iwhite
"else
"    colorscheme industry
endif
