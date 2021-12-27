" Type :so % to refresh .vimrc after making changes

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

set nocompatible

set t_Co=256

" You need pip install neovim in any virtualenv for Ultisnips to work
" Force vim to load python3 before python2
if has('python3')
endif

" Leader - ( Spacebar )
let mapleader = " "

" Vundle here
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

"execute pathogen#infect()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
"Plugin 'Konfekt/FastFold'
Plugin 'altercation/vim-colors-solarized'
Plugin 'cesardeazevedo/Fx-ColorScheme'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'jalvesaq/Nvim-R'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'
Plugin 'martinda/Jenkinsfile-vim-syntax'
Plugin 'mattn/calendar-vim'
Plugin 'morhetz/gruvbox'
Plugin 'nvie/vim-flake8'
Plugin 'plasticboy/vim-markdown'
Plugin 'neomake/neomake'
Plugin 'sunaku/vim-ruby-minitest'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-perl/vim-perl'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-commentary'
Plugin 'numirias/semshi'
Plugin 'sheerun/vim-polyglot'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'dense-analysis/ale'
Plugin 'neoclide/coc.nvim'
Plugin 'pappasam/coc-jedi'

call vundle#end()

let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}

let g:ale_fixers = {
      \    'python': ['yapf'],
      \}

nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

nmap <silent> gd <Plug>(coc-definition)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <leader>rn <Plug>(coc-rename)

set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

" Plugin 'vim-scripts/indentpython.vim'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'bitc/bad-whitespace'
" Plugin 'scrooloose/syntastic'
" Plugin 'vim-syntastic/syntastic'

" PluginInstall

filetype plugin indent on

set backspace=2   " Backspace deletes like most programs in insert mode

set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=9999

let python_highlight_all=1

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

runtime! ftplugin/man.vim

let g:pydiction_location = '$HOME/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 5

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd       " Show (partial) command in status line.
set ignorecase    " Do case insensitive matching
set smartcase     " Do smart case matching
set incsearch     " Incremental search
set tabstop=2     " tamanho das tabulações
set shiftwidth=2  " quantidade de espaços de uma tabulação
set shiftround    " [>>|<<] moves it to the next multiple value of shiftwidth
set expandtab     " convert <TAB> to <space>
"need :retab
set ai            " auto identação
set backup        " habilita a criação de arquivos de backup
set bex=~         " especifica a extensão do backup
set ttyfast       " melhora o redraw das janelas
set cul           " abreviação de cursor line ( destaca a linha atual )
set cuc           " abreviação de cursor column ( destaca a coluna atual )
set nu            " mostra numeração de linhas
set numberwidth=5 " quantidades de casas ocupadas pelos numeros
set listchars=tab:»·,trail:·,nbsp:·,eol:¬
set list
set ruler
set encoding=utf-8
set hlsearch

"Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"Auto resize Vim splits to active split
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

"HTML Editing
set matchpairs+=<:>

"Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

"let g:rehash256 = 1
"
set autowrite   " Automatically save before commands like :next and :make
set autoread
" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !

colorscheme gruvbox
let g:airline_theme="molokai"

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"some usual mapping
:map <F3> :VimwikiAll2HTML<CR>:e<CR>


" General
":map <Leader>sc :SyntasticCheck<CR>

" Python
:map <Leader>pp  :!python3 %<CR>
:map <Leader>lpp :!clear; python3 %<CR>
:map <Leader>ppt :!pytest<CR>

"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" let g:syntastic_python_flake8_exec = 'python3'
" let g:syntastic_python_flake8_args = ['-m', 'flake8']
" let g:syntastic_python_flake8_args = ['-m', 'pylint']
" let g:syntastic_python_checkers = ['pylint']

"C/Cpp
:map <F4>        :!make<CR>
:map <Leader>bmc :!bm gcc % %:r<CR>
:map <Leader>bmp :!bm g++ % %:r<CR>
:map <Leader>cc  :!make run<CR>
:map <Leader>lcc :!clear; make run<CR>
"test ??? :map <Leader>ppt :!pytest<CR>

"Java
:map <F5> :!ant<CR>

"HTML
autocmd FileType html :map ;p i<p></p><Esc>^f>a
autocmd FileType html :map ;1 i<h1></h1><Esc>^f>a
autocmd FileType html :map ;2 i<h1></h2><Esc>^f>a
autocmd FileType html :map ;3 i<h1></h3><Esc>^f>a
autocmd FileType html :map ;4 i<h1></h4><Esc>^f>a
autocmd FileType html :map ;5 i<h1></h5><Esc>^f>a
autocmd FileType html :map ;6 i<h1></h6><Esc>^f>a
autocmd FileType html :map ;d i<div></div><Esc>^f>a


:nnoremap <Leader>ff :buffers<CR>:buffer<Space>

set tw=79
set colorcolumn=80,81,82,83,84,85,86
au BufNewFile,BufRead * setlocal formatoptions+=t

let g:DoxygenToolkit_briefTag_pre="@Synopsis " 
"let g:DoxygenToolkit_paramTag_pre="@Param :: " 
"let g:DoxygenToolkit_returnTag="@retval " 
"let g:DoxygenToolkit_blockHeader="-------------------------------" let
"g:DoxygenToolkit_blockFooter="-------------------------------" 
let g:DoxygenToolkit_authorName="Jhonatan Casale" 
let g:DoxygenToolkit_licenseTag="private license"   "<-- !!! Does not end with \<enter>

let g:tex_flavor = "latex"

" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  en
  return ''
endfunction

" I want to see Python.docstrings `unfolded`
nnoremap <space> za

" SimpyIFold
set foldmethod=indent
set foldlevel=99
set foldnestmax=2
let g:SimpylFold_docstring_preview = 1

" FastFold
"let g:tex_fold_enabled=1
"let g:vimsyn_folding='af'
"let g:xml_syntax_folding = 1
"let g:php_folding = 1
"let g:perl_fold = 1
"let g:python_fold = 1

" Enable folding with the spacebar

" P"ython configs
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

"augroup vimrc
"  au BufReadPre * setlocal foldmethod=indent
"  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

"Toggle relative numbering, and set to absolute on loss of focus or insert mode
set rnu
function! ToggleNumbersOn()
  set nu!
  set rnu
endfunction
function! ToggleRelativeOn()
  set rnu!
  set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"Use enter to create new lines w/o entering insert mode
nnoremap <CR> o<Esc>
"Below is to fix issues with the ABOVE mappings in quickfix window
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %

" Always use vertical diffs
set diffopt+=vertical

" Load up all of our plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

""" SYSTEM CLIPBOARD COPY & PASTE SUPPORT
set pastetoggle=<F2> "F2 before pasting to preserve indentation
"Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"
map <silent><C-b> :set paste<CR>o<esc>"*]p:set nopaste<cr>"

""" MORE AWESOME HOTKEYS
"
" bind K to grep word under cursor
"nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
"
"" bind \ (backward slash) to grep shortcut
"command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
"nnoremap \ :Ag<SPACE>

""Map Ctrl + S to save in any mode
"noremap <silent> <C-S>          :update<CR>
"vnoremap <silent> <C-S>         <C-C>:update<CR>
"inoremap <silent> <C-S>         <C-O>:update<CR>
"" Also map leader + s
"map <leader>s <C-S>

"" Quickly close windows
nnoremap <leader>x :x<cr>
nnoremap <leader>X :q<cr>

"" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

"" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>

inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" AUTOCOMMANDS - Do stuff

" Save whenever switching windows or leaving vim. This is useful when running
" the tests inside vim without having to save all files first.
au FocusLost,WinLeave * :silent! wa

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

"update dir to current file
autocmd BufEnter * silent! cd %:p:h

augroup vimrcEx
  autocmd!

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.rdoc set filetype=markdown

"" Enable spellchecking for Markdown
"autocmd FileType markdown setlocal spell

" "Automatically wrap at 80 characters for Markdown
"autocmd BufRead,BufNewFile *.md setlocal textwidth=80

"Automatically wrap at 72 characters and spell check git commit messages
autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit setlocal spell

" Allow stylesheets to autocomplete hyphenated words
autocmd FileType css,scss,sass,less setlocal iskeyword+=-
augroup END

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

map <Leader>p <Plug>(easymotion-prefix)
nmap S <Plug>(easymotion-s2)
nmap T <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

"vimwiki syntax highlight configuration
"nmap <Leader>wf <Plug>VimwikiFollowLink 
let wiki = {}
let wiki.path = '$HOME/vimwiki/'
"TODO adicionar mais syntax's aqui
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'java': 'java','make': 'make', 'bash': 'sh', 'sql': 'sql'}
let g:vimwiki_list = [wiki]
"let g:vimwiki_list = [{
"  \ 'path': '~/misc/vimwiki/',
"  \ 'path_html': '~/web/otherware.org/vimwiki/',
"  \ 'template_path': '~/misc/vimwiki/',
"  \ 'template_default': 'default',
"  \ 'template_ext': '.tpl.html',
"  \ 'css_name': 'style.css',
"  \ 'auto_export': 1}]
"let g:vimwiki_list = [{'path': '/home/${USER}/vimwiki/', 'path_html': '/home/${USER}/vimwiki_html/'}]

" properly Calendar panel size
nmap <Leader>dc :Calendar<cr>:vertical resize 27<cr>
nmap <silent><Leader>bo :.!${MAIN_SCRIPTS}/diary_wiki_template.sh<cr>


" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

set conceallevel=2
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

"set completefunc=syntaxcomplete#Complete

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF
