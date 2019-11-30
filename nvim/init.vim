"set nu
set paste
set ts=4 "设置tab为4个空格
"set autoindent "自动缩进
set listchars=tab:>-,trail:- "设置空格和tab可见
set directory=. "设置swap file位置

" 设置状态栏显示行列号
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" 设置所在行列高亮
set cul
"set cuc

autocmd BufWritePost $MYVIMRC source $MYVIMRC
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <C-s>     <C-O>:w<cr>
nnoremap <C-s>     :w<cr>
nnoremap <leader>w :w<cr>

call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tomasr/molokai'
"Plug 'valloric/YouCompleteMe'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/ctags.vim'
Plug 'nine2/vim-copyright'
call plug#end()

" theme
colorscheme molokai
let g:molokai_original = 1

" NERDTree_config
map <F2> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home='~/bak'

" Tagbar_config
nmap <F10> :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=30
autocmd BufReadPost *.py*.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

" ycm_config
"let g:ycm_global_ycm_extra_conf='/root/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
"let g:ycm_key_list_select_completion=['<C-n>']
"let g:python3_host_prog='/root/miniconda3/bin/python3.7'
"let g:ycm_python_binary_path='/root/miniconda3/bin/python3.7'
"let g:ycm_seed_identifiers_with_syntax=1

" copyright
nmap <F4> :CopyrightAdd<CR>
let g:file_copyright_name="lwk"
let g:file_copyright_email="510062390@qq.com"
let g:file_copyright_auto_filetypes=['sh', 'py', 'cpp', 'c', 'java']

" python
map <F5> :w<cr>:r!python3 %<cr>

" auto
" add/update copyright
au VimEnter *.c,*.cpp,*.sh,*.java,*.py :CopyrightAdd
