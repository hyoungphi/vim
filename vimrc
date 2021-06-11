" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
"syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif




set nu
set autoindent
set cindent
" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

set laststatus=2 " 상태바 표시를 항상한다
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
set ignorecase

set showmatch " 일치하는 괄호 하이라이팅
set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2
" Highlight line with cursor
set cursorline
" 구문 강조 사용
if has("syntax")
 syntax on
endif

" 버퍼 목록 켜기
let g:airline#extensions#tabline#enabled = 1

" 파일명만 출력
let g:airline#extensions#tabline#fnamemod = ':t'
"버퍼 번호 출력
let g:airline#extensions#tabline#buffer_nr_show = 1


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Plugin 'bundle/vundle.vim'
Plugin 'VundleVim/Vundle.vim'
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'file:///home/gmarik/path/to/plugin'
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'AutoComplPop'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'taglist-plus'
call vundle#end()
colorscheme jellybeans

set mouse=a

function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc

map <F6> <ESC>:call ToggleMouse()<CR>

map <LEADER>n <ESC>:NERDTree<CR>
map <F8> <ESC>:TlistToggle<CR>
let Tlist_Use_Right_Window = 1

"map <UP> <UP>z.
"map <DOWN> <DOWN>z.
"z.
"call z<CR>
highlight CursorLine cterm=underline gui=underline
"highlight CursorLine cterm=bold gui=bold
"highlight CursorLine ctermfg=White ctermbg=Yellow

augroup KeepCentered
  autocmd!
  autocmd CursorMoved * normal! zz
augroup END
