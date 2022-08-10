set nocompatible
set backspace=indent,eol,start
set smartindent
set number
filetype plugin indent on
syntax enable
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"    :w !bash
call plug#begin('~/.vim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'ycm-core/YouCompleteMe'
" Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-sensible'
" Use gcc to comment out a line (takes a count), 
" gc to comment out the target of a motion (for example, gcap to comment out a paragraph), 
" gc in visual mode to comment out the selection, and gc in operator pending mode to target a comment. 
" You can also use it as a command, either with a range like :7,17Commentary, 
" or as part of a :global invocation like with :g/TODO/Commentary. That's it.
" Oh, and it uncomments, too. The above maps actually toggle, and gcgc uncomments a set of adjacent commented lines.
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'vimwiki/vimwiki'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'godlygeek/tabular'
Plug 'ycm-core/YouCompleteMe'
Plug 'plasticboy/vim-markdown'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } 
Plug 'luochen1990/rainbow'
Plug 'vim-nerdtree/nerdtree'
Plug 'vim-utils/vim-man'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sheerun/vim-polyglot'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'fatih/molokai'
Plug 'morhetz/gruvbox'
"Plug 'preservim/tagbar'
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
Plug 'zhimsel/vim-stay'
Plug 'alok/notational-fzf-vim'
call plug#end()

let mapleader = ","
noremap \ ,
inoremap jk <esc>
nnoremap <c-e> ,
vnoremap <c-e> ,
set noswapfile
set background=dark
set path+=**
set hidden
set ignorecase
set smartcase
set wrap
set textwidth=80
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4 " Let backspace delete indent
set nojoinspaces  " Prevents inserting two spaces after punctuation on a join (J)
set virtualedit=all
set mouse=a
set mousehide
set history=8192 " more history
if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         
        set clipboard=unnamed
    endif
endif
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
nnoremap Y y$
cmap w!! w !sudo tee % >/dev/null

augroup filetypedetect
  command! -nargs=* -complete=help Help vertical belowright help <args>
  autocmd FileType help wincmd L
  autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
  autocmd BufNewFile,BufRead *.hcl setf conf
  autocmd BufRead,BufNewFile *.gotmpl set filetype=gotexttmpl
  autocmd BufNewFile,BufRead *.ino setlocal noet ts=4 sw=4 sts=4
  autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.html setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.vim setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.hcl setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.sh setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.proto setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
  autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
augroup END


if has('terminal')
  " Kill job and close terminal window
  tnoremap <Leader>q <C-w><C-C><C-w>c<cr>
  " switch to normal mode with esc
  tnoremap <Esc> <C-W>N
  " Open terminal in vertical, horizontal and new tab
  nnoremap <leader>tv :vsplit<cr>:term ++curwin<CR>
  nnoremap <leader>ts :split<cr>:term ++curwin<CR>
  nnoremap <leader>tt :tabnew<cr>:term ++curwin<CR>
  tnoremap <leader>tv <C-w>:vsplit<cr>:term ++curwin<CR>
  tnoremap <leader>ts <C-w>:split<cr>:term ++curwin<CR>
  tnoremap <leader>tt <C-w>:tabnew<cr>:term ++curwin<CR>
endif

let g:ale_linters = {'cpp':['clang'],'c': ['clang'],'python':['mypy'],'javascript': ['eslint'], 'go': ['gopls'], 'terraform': ['terraform']}
let g:ale_fixers = {'python': ['black'], 'terraform': ['terraform','remove_trailing_lines', 'trim_whitespace']}
let g:ale_python_black_executable = 'black'
let g:ale_python_black_options = '--line-length 130'
let g:ale_fix_on_save = 1
let g:ale_python_mypy_auto_poetry = 1
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
nmap <silent> <leader>j :ALENext<cr>
nmap <silent> <leader>k :ALEPrevious<cr>


" The default Expand tab key was confict with ycm
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" Setup for YCM
let g:ycm_enable_semantic_highlighting=1

let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
let g:UltiSnipsEditSplit="vertical"

nnoremap <leader>jd :YcmCompleter GoTo<CR>
" Setup for markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['go=go', 'viml=vim', 'bash=sh']
let g:vim_markdown_conceal = 0
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_extensions_in_markdown = 1

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" nnoremap <Leader>d :Files ~/Dropbox<CR>
nnoremap <leader>vv :vsp $MYVIMRC<cr>
nnoremap <leader>sv :w <CR>:source $MYVIMRC<cr>
nnoremap <leader>ss :vsp ~/.tmux.conf<cr>

" Setup window shortcuts.
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Set up persistent undo across all files.
if !isdirectory($HOME."/.vim/undodir")
    call mkdir($HOME."/.vim/undodir", "", 0770)
endif
set undodir=~/.vim/undodir
set undofile

" Expand the directory of the current file anywhere.
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" NerdTree {
map <C-n> :NERDTreeToggle<CR>
"let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=0
let NERDTreeKeepTreeInNewTab=1

let g:vimwiki_list = [{
            \ 'path': '~/Dropbox/seneca/zyang/config/vimwiki/',
            \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

" Golang
augroup go
  autocmd!
  autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)
  autocmd FileType go nmap <silent> <Leader>d <Plug>(go-def-tab)
  autocmd FileType go nmap <silent> <Leader>x <Plug>(go-doc-vertical)
  autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  "autocmd FileType go nmap <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <silent> <leader>e  <Plug>(go-install)
  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)
  " I like these more!
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

set t_Co=256
colorscheme PaperColor

" Fast saving
nnoremap <leader>w :w!<cr>
nnoremap <silent> <leader>q :q!<CR>

" Do not show stupid q: window
map q: :q
" Disable the doc preview window at top
set completeopt-=preview

let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gs <Plug>(openbrowser-smart-search)
vmap gs <Plug>(openbrowser-smart-search)

" FZF
" The default extra key bindings
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit'}

map <leader>f :Files<CR>
map <leader>b :Buffers<CR>
map <leader>a :Ag<CR>

set foldmethod=indent
autocmd BufRead * normal zR

nnoremap <space> za
vnoremap <space> zf
" Open all level folds for one fold
nnoremap <leader>z zczA
" za toggles a fold under the cursor.
" zc closes a fold underneath the cursor.
" zC closes all folds underneath the cursor, recursively.
" zm closes a level of fold in the buffer.
" zM closes all folds in the buffer.
" zo opens a fold underneath the cursor.
" zO opens all folds underneath the cursor, recursively.
" zR opens all folds in the buffer.
" zr opens a level of fold in the buffer.

" WSL yank support
" let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
" if executable(s:clip)
"     augroup WSLYank
"         autocmd!
"         autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
"     augroup END
" endif

let g:nv_search_paths = ['~/wiki', 'notes.md']
nnoremap <silent> <leader>n :NV<CR>
