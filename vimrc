"YYing (spongeyao@gmail.com)

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
"Plugin 'gmarik/Vundle.vim'

Plugin 'Syntastic'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" SnipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" Snippets
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'

Bundle 'The-NERD-tree'
call vundle#end()
filetype plugin indent on
"bundle end

"set foldmethod=indent
"set nocompatible
set secure

"set mouse=a
set cursorline
set autoindent
set laststatus=2
let g:airline_theme='wombat'  "choose your vim-airline theme
"set statusline=%4*%<\ %1*[%F]
"set statusline+=%4*\ %5*[%{&encoding}, " encoding
"set statusline+=%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]%m
"set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \> 

set backspace=2         " allow backspacing over everything in insert mode
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
"set dictionary=~/.dict  " my dictionary :p

"set expandtab           " expand tabs to spaces.
set wildchar=<TAB>      " such as <TAB> in shell
set smarttab
"set tabstop=4
set shiftwidth=4

set nu
set t_Co=256              " number of colors
set showcmd             " show command
set showmode            " show current mode
set incsearch           " While typing a search pattern, show immediately 
                        " where the so far typed pattern matches.
set hlsearch            " When there is a previous search pattern, 
                        " highlight all its matches.
syntax on               " show parts of the text in another font or color

set fileencodings=utf-8,cp936,big5,latin1
set background=dark

autocmd FileType c,cpp,cc,java call PROG()
autocmd FileType make setlocal noexpandtab

colorscheme diablo3

function PROG()
    set showmatch
    set nosmartindent
    set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30
    set cinoptions=t0
    imap <C-a>f <END><CR>for(;;) {<CR>}<LEFT>
                \<CR><UP><UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT>
    imap <C-a>w <END><CR>while( ) {<CR>}<LEFT>
                \<CR><UP><UP><UP><END><LEFT><LEFT>
    set formatoptions=tcqr
endfunction


highlight Comment    ctermfg=DarkCyan
highlight SpecialKey ctermfg=Yellow

map <F2> :update<CR>                    " using :update to replace :w
map <F3> :update<CR>:q<CR>
map <F4> :w<CR>
map <F5> :wq<CR>
map <F6> :bn<CR>
"map <F8> :set hls!<BAR>set hls?<CR>     " toggle on/off highlightsearch
map <F8> :set paste!<BAR>set paste?<CR> " toggle on/off paste mode
set pastetoggle=<F8>
map <F9> :!make %:r <CR>

map <F7> :if exists("syntax_on") <BAR>  " press <F7> syntax on/off
        \   syntax off <bar><cr>
        \ else <BAR>
        \   syntax on <BAR>
        \ endif <CR>

map <F10> <ESC>:read !date<CR>

"colo darkblue
highlight User1 ctermfg=red
highlight User2 term=underline cterm=underline ctermfg=green
highlight User3 term=underline cterm=underline ctermfg=yellow
highlight User4 term=underline cterm=underline ctermfg=white
highlight User5 ctermfg=cyan
highlight User6 ctermfg=white

"smart mapping for tab completion
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction 

inoremap <TAB> <C-R>=InsertTabWrapper()<CR>

"setting env for python
filetype indent plugin on
set modeline
let python_hightlight_all = 1

"=========================
"默认配置文件路径"
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
""打开vim时不再询问是否加载ycm_extra_conf.py配置"
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
"python解释器路径"
"let g:ycm_path_to_python_interpreter='/usr/local/bin/python'
""是否开启语义补全"
let g:ycm_seed_identifiers_with_syntax=1
"是否在注释中也开启补全"
"let g:ycm_complete_in_comments=1
"let g:ycm_collect_identifiers_from_comments_and_strings = 0
""开始补全的字符数"
let g:ycm_min_num_of_chars_for_completion=2
"补全后自动关机预览窗口"
"let g:ycm_autoclose_preview_window_after_completion=1
"" 禁止缓存匹配项,每次都重新生成匹配项"
let g:ycm_cache_omnifunc=0
"字符串中也开启补全"
"let g:ycm_complete_in_strings = 1
""离开插入模式后自动关闭预览窗口"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项"
"inoremap <expr> <CR>       pumvisible() ? '<C-y>' : '\<CR>'     
""上下左右键行为"
inoremap <expr> <Down>     pumvisible() ? '\<C-n>' : '\<Down>'
inoremap <expr> <Up>       pumvisible() ? '\<C-p>' : '\<Up>'
inoremap <expr> <PageDown> pumvisible() ? '\<PageDown>\<C-p>\<C-n>' : '\<PageDown>'
inoremap <expr> <PageUp>   pumvisible() ? '\<PageUp>\<C-p>\<C-n>' : '\<PageUp>'


