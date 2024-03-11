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
