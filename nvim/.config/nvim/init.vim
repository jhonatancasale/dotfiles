set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

"Old .vimrc begin

runtime! debian.vim

set nocompatible

set t_Co=256

if has('python3')
endif

let mapleader = " "

filetype off

call plug#begin('~/.vim/plugged')

Plug 'ambv/black'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'

Plug 'altercation/vim-colors-solarized'
Plug 'cesardeazevedo/Fx-ColorScheme'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'shaneharper/vim-rtags'
Plug 'godlygeek/tabular'
Plug 'jalvesaq/Nvim-R'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'mattn/calendar-vim'
Plug 'morhetz/gruvbox'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvie/vim-flake8'
Plug 'plasticboy/vim-markdown'
Plug 'neomake/neomake'
Plug 'sunaku/vim-ruby-minitest'
Plug 'tmhedberg/SimpylFold'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'jremmen/vim-ripgrep'
Plug 'vim-perl/vim-perl'
Plug 'vim-ruby/vim-ruby'
Plug 'vimwiki/vimwiki'
Plug 'numirias/semshi'
Plug 'sheerun/vim-polyglot'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'dense-analysis/ale'
Plug 'mbbill/undotree'
Plug 'vim-utils/vim-man'

call plug#end()

if executable('rg')
    let g:rg_derive_root='true'
endif

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

" nmap <silent> gd <Plug>(coc-definition)

" nnoremap <silent> K :call <SID>show_documentation()<CR>
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" nmap <leader>rn <Plug>(coc-rename)

filetype plugin indent on

set backspace=2   " Backspace deletes like most programs in insert mode
set history=9999


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Main set
set noerrorbells
set showcmd                     " Show (partial) command in status line.
set ignorecase                  " Do case insensitive matching
set smartcase                   " Do smart case matching
set smartindent
set incsearch                   " Incremental search
set tabstop=4 softtabstop=4     " tamanho das tabulações
set shiftwidth=4                " quantidade de espaços de uma tabulação
set shiftround                  " [>>|<<] moves it to the next multiple value of shiftwidth
set expandtab                   " convert <TAB> to <space>
"need :retab
set ai                          " auto identação
set ttyfast                     " melhora o redraw das janelas
set cul                         " abreviação de cursor line ( destaca a linha atual )
set cuc                         " abreviação de cursor column ( destaca a coluna atual )
set nu                          " mostra numeração de linhas
set numberwidth=5               " quantidades de casas ocupadas pelos numeros
set listchars=tab:»·,trail:·,nbsp:·,eol:¬
set list
set ruler
set encoding=utf-8
set hlsearch
set noswapfile
set undodir=~/.vim/undodir
set undofile

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

set autowrite   " Automatically save before commands like :next and :make
set autoread

" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !

"some usual mapping
:map <F3> :VimwikiAll2HTML<CR>:e<CR>

" Python
let python_highlight_all=1
:map <Leader>pp  :!python3 %<CR>
:map <Leader>lpp :!clear; echo ""; python3 %<CR>
:map <Leader>ppt :!pytest<CR>

"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

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
execute "set colorcolumn=" . join(range(80,86), ',')
au BufNewFile,BufRead * setlocal formatoptions+=t

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

" Python configs
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
autocmd BufNewFile,BufRead .aliases set syntax=bash

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

let g:NERDTreeWinPos = "left"
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let NERDTreeShowHidden=1

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
nnoremap <Leader>u :UndotreeShow<CR>
nnoremap <Leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>

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

"Old .vimrc end

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endi
let g:gruvbox_invert_selection='0'

colorscheme gruvbox
set background=dark
let g:airline_theme="molokai"

set completeopt=menu,menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
EOF

lua << END
require'lualine'.setup {
  options = {
    icons_enabled = false,
    theme = 'gruvbox_dark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
END
