let mapleader =" "
"识别文件类型
filetype on
"按文件类型加载插件
filetype plugin on
"语法高亮
syntax enable
syntax on
"设置256色
set t_Co=256
"
set scrolloff=5
set noeb
set wrap
set showcmd
set wildmenu
set virtualedit=block,onemore
set number
set relativenumber
set cursorline
set hlsearch
set incsearch
set ignorecase
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread
set autowrite
set foldmethod=indent   " 开启代码折叠
set nofoldenable
se mouse+=a

set langmenu=zh_CN.UTF-8
set helplang=cn
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

""""""""""""""""""""""""""""""""""""""""""""
"快捷键配置
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map J 5j
map K 5k
noremap = nzz
noremap - Nzz
noremap <leader><CR> :nohlsearch<CR>
noremap ff :NERDTreeToggle<CR>
nnoremap <C-s-tab> :PreviousBuffer<cr>
nnoremap <C-tab> :NextBuffer<cr>
nnoremap <leader>d :CloseCurrentBuffer<cr>
nnoremap <leader>D :BufOnly<crt>

"函数列表
nmap <F2> :TagbarToggle<CR>

"窗口大小
noremap <C-H> <C-w>5<
noremap <C-L> <C-w>5>

"函数折叠
noremap zo zO

"拼写检查
map <leader>ss :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s

"保存管理员权限文件
noremap <leader>S :w! sudo tee %<CR>

map <leader><leader> <Esc>/<++><CR>:nohlsearch<CR>df>i

"""""""""""
"主题
let g:SnazzyTransparent = 1



""""""""""""""""""""""""""""""""""""""""
"插件
call plug#begin('~/.vim/plugged')
"将选中的词前后同时添加符号
Plug 'tpope/vim-surround'
"全局搜索
Plug 'mileszs/ack.vim'
"自动补全括号
Plug 'Raimondi/delimitMate'
"切换主题
Plug 'chxuan/change-colorscheme'
"顶栏美化
Plug 'chxuan/vim-buffer'
"vim首页
Plug 'chxuan/vimplus-startify'
"代码补全
Plug 'Valloric/YouCompleteMe'
"vim资源管理器
Plug 'scrooloose/nerdtree'
"资源管理器美化
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"资源管理器插件
Plug 'Xuyuanp/nerdtree-git-plugin'
"允许vim使用图标字体
Plug 'ryanoasis/vim-devicons'
"自动格式化
Plug 'Chiel92/vim-autoformat'
"底部状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"缩进线
Plug 'Yggdroot/indentLine'
Plug 'kien/rainbow_parentheses.vim'
"代码差错
Plug 'scrooloose/syntastic'
"vim主题
Plug 'connorholyday/vim-snazzy'
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
"python调试
Plug 'sillybun/setbreakpoints_python'
"洁净模式
Plug 'junegunn/goyo.vim'
"在侧边显示代码中的函数
Plug 'preservim/tagbar'
"匹配括号
Plug 'jiangmiao/auto-pairs'
set shortmess+=c

call plug#end()

color snazzy


""""""""""""""""""""""""""""""""""""
"函数
"剪贴板
vmap <leader>y "+y
nnoremap <leader>p "+p
"打开最近位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 分屏窗口移动
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>h <c-w>h
nnoremap <leader>l <c-w>l
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"自动执行函数F5
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!clear"
                exec "!time python3 %"
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
                " exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
        endif
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"自动格式化
nnoremap <F6> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"括号配置
let g:rbpt_colorpairs = [
                        \ ['brown',       'RoyalBlue3'],
                        \ ['Darkblue',    'SeaGreen3'],
                        \ ['darkgray',    'DarkOrchid3'],
                        \ ['darkgreen',   'firebrick3'],
                        \ ['darkcyan',    'RoyalBlue3'],
                        \ ['darkred',     'SeaGreen3'],
                        \ ['darkmagenta', 'DarkOrchid3'],
                        \ ['brown',       'firebrick3'],
                        \ ['gray',        'RoyalBlue3'],
                        \ ['darkmagenta', 'DarkOrchid3'],
                        \ ['Darkblue',    'firebrick3'],
                        \ ['darkgreen',   'RoyalBlue3'],
                        \ ['darkcyan',    'SeaGreen3'],
                        \ ['darkred',     'DarkOrchid3'],
                        \ ['red',         'firebrick3'],
                        \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"代码差错
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='✹'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1
let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_html_checkers=['tidy', 'jshint']
" 修改高亮的背景色, 适应主题
highlight SyntasticErrorSign guifg=white guibg=black

" to see error location list
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
nnoremap <Leader>s :call ToggleErrors()<cr>
nnoremap <Leader>= :lnext<cr>
nnoremap <Leader>- :lprevious<cr>

" airline
"let g:airline_theme="hybridline"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_b='%{strftime("%H:%M:%S")}'
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''




" nerdtree
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'


" YCM
" 如果不指定python解释器路径，ycm会自己搜索一个合适的(与编译ycm时使用的python版本匹配)
" let g:ycm_server_python_interpreter = '/usr/bin/python2.7'
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '✹'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.','re![_a-zA-z0-9]'],
            \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
            \             're!\[.*\]\s'],
            \   'ocaml' : ['.', '#'],
            \   'cpp,objcpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::'],
            \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \ }

" vim-buffer
nnoremap <silent> <c-p> :PreviousBuffer<cr>
nnoremap <silent> <c-n> :NextBuffer<cr>
nnoremap <silent> <leader>d :CloseBuffer<cr>
nnoremap <silent> <leader>D :BufOnly<cr>

" 自动格式化
nnoremap <F6> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

"python调试
autocmd FileType python nnoremap <F10> :call ToggleBreakPoint()<Cr>


"设置不同的光标
"Mode Settings

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar



"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"
