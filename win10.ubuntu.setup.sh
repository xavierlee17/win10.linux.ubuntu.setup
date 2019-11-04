#!/bin/bash --posix

pass=0
if [ "`whoami`" != "root" ]; then
        pass=1
fi
############################ root only start
if [ $pass -eq 0 ]; then
mv /etc/apt/sources.list /etc/apt/sources.list.bak
cat << EOF > /etc/apt/sources.list
deb http://cmc-cd-mirror.rnd.huawei.com/ubuntu/ xenial main multiverse restricted universe
deb http://cmc-cd-mirror.rnd.huawei.com/ubuntu/ xenial-backports main multiverse restricted universe
deb http://cmc-cd-mirror.rnd.huawei.com/ubuntu/ xenial-proposed main multiverse restricted universe
deb http://cmc-cd-mirror.rnd.huawei.com/ubuntu/ xenial-security main multiverse restricted universe
deb http://cmc-cd-mirror.rnd.huawei.com/ubuntu/ xenial-updates main multiverse restricted universe
deb-src http://cmc-cd-mirror.rnd.huawei.com/ubuntu/ xenial main multiverse restricted universe
deb-src http://cmc-cd-mirror.rnd.huawei.com/ubuntu/ xenial-backports main multiverse restricted universe
deb-src http://cmc-cd-mirror.rnd.huawei.com/ubuntu/ xenial-proposed main multiverse restricted universe
deb-src http://cmc-cd-mirror.rnd.huawei.com/ubuntu/ xenial-security main multiverse restricted universe
deb-src http://cmc-cd-mirror.rnd.huawei.com/ubuntu/ xenial-updates main multiverse restricted universe
EOF
apt-get update
apt-get dist-upgrade -y
apt-get install -y vim perl tcl tk python ssh subversion dos2unix autojump htop x11-apps xorg csh tcsh gawk dclock axel aria2 tar p7zip-full p7zip-rar zip unzip rar unrar safe-rm xpdf
fi
############################ root only end

############################ setup bash aliases start
cat <<EOF > ~/.bash_aliases
alias de="cd `find /mnt/c/Users/ -type d -maxdepth 2 | grep -i desktop | grep -vi default | grep -vi public`"
alias cc="cd /mnt/c"
alias dd="cd /mnt/d"
alias sc="source ~/.bashrc"
alias vc="vim ~/.bashrc"
alias ..="cd .."
alias c="clear"
alias h="history"
alias clock="dclock -date \"%Y %b %d %a\" &"
alias aptc="apt-get autoremove;apt-get autoclean;find /var/cache/apt/archives/ -type f | grep deb | xargs rm -rvf"
export DISPLAY="localhost:0"
. /usr/share/autojump/autojump.sh
EOF
############################ setup bash aliases end

############################ setup vimrc start
cat << EOF > ~/.vimrc
autocmd InsertEnter * se cul
autocmd InsertLeave * se nocul
set t_Co=256
filetype on
filetype plugin on
filetype plugin indent on
set ai!
set ambiwidth=double
set autoindent
set autoread
set backspace=2
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
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
set foldcolumn=0
set guifont=Courier_New:h10:cANSI
set hidden
set history=1000
autocmd BufRead * set hlsearch
set ignorecase
set incsearch
set magic
set nobackup
set nocompatible
set nocp
set expandtab
set novisualbell
set nowrap
set nohls
set nu
set ruler
set showcmd
set showmatch
set sm
set smartindent
set smarttab
set softtabstop=4
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set tabstop=4
set termencoding=utf-8
set writebackup
syntax enable
syntax on
syntax manual
autocmd BufRead *.drc       set syntax=java
autocmd BufRead *.lvs       set syntax=java
autocmd BufRead *.inc       set syntax=java
autocmd BufRead *.sum       set syntax=java
autocmd BufRead *run.log    set syntax=java
autocmd BufRead *.tvf       set syntax=tcl
autocmd BufRead *.tcl       set syntax=tcl
autocmd BufRead *.tk        set syntax=tcl
autocmd BufRead *.perc      set syntax=java
autocmd BufRead *.vcell     set syntax=tcl
autocmd BufRead *bash*,*sh* set syntax=sh
autocmd BufRead *csh*       set syntax=csh
autocmd BufRead *vim*       set syntax=vim
autocmd BufRead *.cdl*      set syntax=asm68k
autocmd BufRead *.perl,*.pl set syntax=perl
autocmd BufRead *.txt       set syntax=txt
autocmd BufRead *.map    set syntax=maple
autocmd BufRead *.c,*.cpp set syntax=cpp | colorscheme slate
set mouse-=a
set clipboard+=unnamed
set iskeyword+=_,$,@,%,#,-,+
set wildmenu
set report=0
if (has("gui_running")) 
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
endif
colorscheme ron
EOF
############################ setup vimrc end

############################ setup pip start
mkdir -p ~/.pip
cat << EOF > ~/.pip/pip.conf
[global]
trusted-host=cmc-cd-mirror.rnd.huawei.com
index-url=http://cmc-cd-mirror.rnd.huawei.com/pypi/simple/
EOF
############################ setup pip end

source ~/.bashrc

if [ $pass -eq 1 ]; then
        echo "User : `whoami` Set Up Finnished !!!"
        echo "Please used root and run this script again !!!"
        exit 0
fi
if [ $pass -eq 0 ]; then
        apt-get autoremove -y
        apt-get autoclean -y
        find /var/cache/apt/archives/ -type f | grep deb | xargs rm -rvf
        echo "User : `whoami` Set Up Finnished !!!"
        exit 0
fi
exit 0
