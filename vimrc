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
set foldmethod=indent " 开启代码折叠
set foldlevelstart=99
set nofoldenable
set mouse+=a
set shiftwidth=8
set softtabstop=8

set langmenu=zh_CN.UTF-8
set helplang=cn
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

""""""""""""""""""""""""""""""""""""""""""""
"快捷键配置
map S :w<CR>
map Q :q<CR>
map <leader>R :source $MYVIMRC<CR>
noremap <leader><CR> :nohlsearch<CR>
"noremap ff :NERDTreeToggle<CR>
nnoremap <C-s-tab> :PreviousBuffer<cr>
nnoremap <C-tab> :NextBuffer<cr>
nnoremap <leader>d :CloseCurrentBuffer<cr>
nnoremap <leader>D :BufOnly<cr>
nnoremap <Tab> za

"函数列表
nmap <F2> :TagbarToggle<CR>
nmap <C-Left> :vertical res -3<CR>
nmap <C-Right> :vertical res +3<CR>

"窗口大小
noremap <C-H> <C-w>5<
noremap <C-L> <C-w>5>

"函数折叠
noremap zo zO

"拼写检查
map <leader>ss :set spell!<CR>
noremap <C-x> ea<C-x>s
"inoremap <C-x> <Esc>ea<C-x>s

"保存管理员权限文件
noremap <leader>S :w! sudo tee %<CR>

"map <leader><leader> <Esc>/<++><CR>:nohlsearch<CR>df>i



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
" Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
Plug 'voldikss/vim-floaterm'
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
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'yaocccc/vim-hlchunk'
"python调试
Plug 'sillybun/setbreakpoints_python'
"翻译
Plug 'voldikss/vim-translator'
"洁净模式
Plug 'junegunn/goyo.vim'
" 自动切换根目录
Plug 'dbakker/vim-projectroot'
" 在侧边显示代码中的函数
Plug 'preservim/tagbar'
"匹配括号
Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdcommenter'

Plug 'rhysd/accelerated-jk'
" tmux 插件
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
set shortmess+=c

call plug#end()

" color snazzy
let g:lightline = {'colorscheme': 'catppuccin_mocha'}
"""""""""""
colorscheme catppuccin_macchiato
set background=dark
set termguicolors
hi Normal guibg=NONE ctermbg=NONE


""""""""""""""""""""""""""""""""""""
"函数
"剪贴板
vmap <leader>y "+y
nnoremap <leader>p "+p
"打开最近位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 分屏窗口移动
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

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

function! ConflictsHighlight() abort
    syn region conflictStart start=/^<<<<<<< .*$/ end=/^\ze\(=======$\||||||||\)/
    syn region conflictMiddle start=/^||||||| .*$/ end=/^\ze=======$/
    syn region conflictEnd start=/^\(=======$\||||||| |\)/ end=/^>>>>>>> .*$/

    highlight conflictStart ctermbg=red ctermfg=black
    highlight conflictMiddle ctermbg=blue ctermfg=black
    highlight conflictEnd ctermbg=green cterm=bold ctermfg=black
endfunction

augroup MyColors
    autocmd!
    autocmd BufEnter * call ConflictsHighlight()
augroup END

"代码查错
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='✹'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1
let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_html_checkers=['tidy', 'jshint']
" 修改高亮的背景色, 适应主题
"highlight SyntasticErrorSign guifg=white guibg=black

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
let g:airline_theme = 'catppuccin_mocha'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_b='%{strftime("%H:%M:%S")}'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''


" nerdtree
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'


" vim-buffer
nnoremap <silent> <s-e> :PreviousBuffer<cr>
nnoremap <silent> <s-r> :NextBuffer<cr>
nnoremap <silent> <s-x> :CloseBuffer<cr>
nnoremap <silent> <leader>D :BufOnly<cr>

" 自动格式化
nnoremap <F6> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

"python调试
autocmd FileType python nnoremap <F10> :call ToggleBreakPoint()<Cr>

vnoremap <silent> gc V{:call nerdcommenter#Comment('x', 'toggle')<CR>
nnoremap <silent> gc V{:call nerdcommenter#Comment('x', 'toggle')<CR>

" 翻译
nmap <silent> <s-l> <Plug>Translatew

"设置不同的光标
"Mode Settings

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" coc config
" source $HOME/.vim/coc.vim

set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> - <Plug>(coc-diagnostic-prev)
nmap <silent> = <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gh <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nnoremap <silent><nowait> <c-\> :<C-u>FloatermToggle<cr>

" coc-explorer
nnoremap ff :CocCommand explorer<CR>

function! s:explorer_cur_dir()
  let node_info = CocAction('runCommand', 'explorer.getNodeInfo', 0)
  return fnamemodify(node_info['fullpath'], ':h')
endfunction

function! s:exec_cur_dir(cmd)
  let dir = s:explorer_cur_dir()
  execute 'cd ' . dir
  execute a:cmd
endfunction

function! s:init_explorer()
  set winblend=10

  " Integration with other plugins

  " CocList
  nmap <buffer> <Leader>fg <Cmd>call <SID>exec_cur_dir('CocList -I grep')<CR>
  nmap <buffer> <Leader>fG <Cmd>call <SID>exec_cur_dir('CocList -I grep -regex')<CR>
  nmap <buffer> <C-p> <Cmd>call <SID>exec_cur_dir('CocList files')<CR>

  " vim-floaterm
  nmap <buffer> <Leader>ft <Cmd>call <SID>exec_cur_dir('FloatermNew --wintype=floating')<CR>
endfunction

function! s:enter_explorer()
  if &filetype == 'coc-explorer'
    " statusline
    setl statusline=coc-explorer
  endif
endfunction

"augroup CocExplorerCustom
  "autocmd!
  "autocmd BufEnter * call <SID>enter_explorer()
  "autocmd FileType coc-explorer call <SID>init_explorer()
"augroup END
