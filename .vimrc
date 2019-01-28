"-------------------------------------------------
" vundle setting
"-------------------------------------------------
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'gcmt/wildfire.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'klen/python-mode'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
"Plugin 'TaskList.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'jiangmiao/auto-pairs'
Plugin 'plasticboy/vim-markdown'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'lilydjwg/colorizer'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" 立即生效vim配置
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

"-------------------------------------------------
" shortcuts setting
"-------------------------------------------------
" 定义快捷键的前缀，即<Leader>
let mapleader=";"
" 定义快捷键到行首和行尾
nmap <Leader>a 0
nmap <Leader>e $
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
"nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
"nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
"nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
"nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>m %
" easymotion key mapping
map <Leader> <Plug>(easymotion-prefix)
" 映射`用于跳转标记
nmap go `

"-------------------------------------------------
" wildfire setting
"-------------------------------------------------
" 快捷键
map <SPACE> <Plug>(wildfire-fuel)
vnoremap <S-SPACE> <Plug>(wildfire-water)
" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]


"-------------------------------------------------
" folding setting
"-------------------------------------------------
" Enable folding
set foldmethod=indent
"set foldlevel=99
set nofoldenable
" Enable folding with the spacebar
"nnoremap <space> za

let g:SimpylFold_docstring_preview=1

"-------------------------------------------------
" NERDTree setting
"-------------------------------------------------
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>l :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] 

"-------------------------------------------------
" indent setting
"-------------------------------------------------
set expandtab
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=0
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"-------------------------------------------------
" tagbar setting
"-------------------------------------------------
"设置tagbar 子窗口的位置出现在主编辑区的右边
let tagbar_right=1 
" 设置显示／隐藏标签列表子窗口的快捷键。速记：tab list 
nnoremap <Leader>r :TagbarToggle<CR> 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1

"-------------------------------------------------
" format for html/php
"-------------------------------------------------
set expandtab
set tabstop=4 
set softtabstop=4 
set shiftwidth=4
" toggle auto-complete coding
inoremap <C-L> <C-X><C-O>

"-------------------------------------------------
" format for markdown
"-------------------------------------------------
let g:vim_markdown_folding_disabled = 1
"let g:vim_markdown_folding_style_pythonic = 1
"let g:vim_markdown_folding_level = 6
let g:vim_markdown_emphasis_multiline = 0
set conceallevel=2
"let g:vim_markdown_conceal = 0
let g:vim_markdown_toc_autofit = 1
"Syntax extensions
let g:vim_markdown_math = 1 "LaTex math"
let g:vim_markdown_frontmatter = 1 "YAML Front Matter"
let g:vim_markdown_toml_frontmatter = 1 "TOML Front Matter"
let g:vim_markdown_json_frontmatter = 1 "JSON Front Matter"

let g:vim_markdown_new_list_item_indent = 2

au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
let g:markdown_fenced_languages = ['xml', 'html', 'python', 'vim', 'ruby', 'javascript', 'css', 'json', 'sh']

" setting for markdown-preview
let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"

"-------------------------------------------------
" YCM setting
"-------------------------------------------------
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_collect_identifiers_from_tags_files = 1

"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu  

"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif 

"let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
"let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_confirm_extra_conf = 0
"
"在注释输入中也能补全
"let g:ycm_complete_in_comments = 1

let g:ycm_autoclose_preview_window_after_completion=1

"在字符串输入中也能补全
"let g:ycm_complete_in_strings = 1
"
"注释和字符串中的文字也会被收入补全
"let g:ycm_collect_identifiers_from_comments_and_strings = 0

map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> 


let python_highlight_all=1

"-------------------------------------------------
" vim-powerline plugin setting
"-------------------------------------------------
set laststatus=2
set t_Co=256
set number
set cursorline
set cursorcolumn
set hls
syntax on
let g:Powerline_symbols = 'unicode'
set encoding=utf-8
set fileencodings=utf-8,gbk,ucs-bom,cp936
set backspace=indent,eol,start

"-------------------------------------------------
" colorscheme setting 
"-------------------------------------------------
set background=dark
colorscheme solarized
"colorscheme molokai
"colorscheme phd
"colorscheme Zenburn

call togglebg#map("<F5>")

"-------------------------------------------------
" CtrlP setting 
"-------------------------------------------------
let g:ctrlp_map = '<leader>P'
let g:ctrlp_cmd = 'CtrlP'
map <leader>h :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',}
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

"-------------------------------------------------
" Ultisnip setting 
"-------------------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:snips_author='BH_SHI'
let g:snips_email='bh.shi@icloud.com'
let g:snips_github='https://github.com/bhshi'

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
"

"-------------------------------------------------
" cryptmethod setting 
"-------------------------------------------------
" set cryptmethod as blowfish2
set cm=blowfish2

"-------------------------------------------------
" python-mode run setting 
"-------------------------------------------------
" <Leader>r is for call tagbar, use 'gr' repalce '<Lead>r'
" let g:pymode_run = 0
" 不使用python-mode运行python代码
"let g:pymode_run_bind = '<Leader>r'
let g:pymode_run_bind = 'gr'
