local options = {
    autoindent = true,
    backup = false,                                   -- creates a backup file
    clipboard = "unnamedplus",                        -- allows neovim to access the system clipboard
    cmdheight = 2,                                    -- more space in the neovim command line for displaying messages
    completeopt = { "menu", "menuone", "noselect" },  -- mostly just for cmp
    conceallevel = 2,
    fileencoding = "utf-8",                           -- the encoding written to a file
    hlsearch = true,                                  -- highlight all matches on previous search pattern
    incsearch = true,
    ignorecase = true,                                -- ignore case in search patterns
    mouse = "a",                                      -- allow the mouse to be used in neovim
    pumheight = 10,                                   -- pop up menu height
    -- showmode = false,                                 -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2,                                  -- always show tabs
    smartcase = true,                                 -- smart case
    smartindent = true,                               -- make indenting smarter again
    splitbelow = true,                                -- force all horizontal splits to go below current window
    splitright = true,                                -- force all vertical splits to go to the right of current window
    swapfile = false,                                 -- creates a swapfile
    termguicolors = true,                             -- set term gui colors (most terminals support this)
    timeoutlen = 900,                                 -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,                                  -- enable persistent undo
    updatetime = 300,                                 -- faster completion (4000ms default)
    -- updatetime = 50,                                  -- from initial init.vim
    writebackup = false,                              -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true,                                 -- convert tabs to spaces
    shiftwidth = 4,                                   -- the number of spaces inserted for each indentation
    tabstop = 4,                                      -- insert 4 spaces for a tab
    softtabstop = 4,
    shiftround = true,                                -- [>>|<<] moves it to the next multiple value of shiftwidth
    cursorline = true,                                -- highlight the current line
    cursorcolumn = true,                              -- highlight the current column
    number = true,                                    -- set numbered lines
    relativenumber = true,                            -- set relative numbered lines
    numberwidth = 5,                                  -- set number column width to 2 {default 4}
    signcolumn = "yes",                               -- always show the sign column, otherwise it would shift the text each time
    scrolloff = 8,                                    -- is one of my fav
    sidescrolloff = 15,
    guifont = "monospace:h17",                        -- the font used in graphical neovim applications
    errorbells = false,                               -- it's default to false, but just to be sure
    history = 9999,
    showcmd = true,
    listchars = "tab:»·,trail:·,nbsp:+,eol:¬",        -- TODO: this doesn't seem to work
    list = true,
    ruler = true,
    guicursor='',
    hidden = true,
    autowrite = true,
    autoread = true,
    wrap = false,                                     -- display lines as one long line
    -- textwidth = 79,                                -- either wrap = true and this, or wrap = false
    pastetoggle = "<F2>",                             -- "F2 before pasting to preserve indentation
    background = "dark",
    undodir = os.getenv ( "HOME" ) .. "/.vim/undodir",
    backspace = '2',                                  -- Backspace deletes like most programs in insert mode
    spell = true,
    spelllang = { 'en_us' },
    autochdir = true,
    -- [[ Missing things from the original init.vim
    -- set t_Co=256
    -- set winwidth=84
    -- set winheight=5
    -- set winminheight=5
    -- set winheight=999
    -- ]]
}

vim.opt.shortmess:append "c"
vim.opt.matchpairs:append "<:>"
vim.opt.diffopt:append "vertical"

-- VimWiki
vim.g.vimwiki = {}
vim.g.vimwiki.path = os.getenv( "WIKIHOME" )
-- vim.g.vimwiki_ext2syntax = {{".md" = 'markdown', .markdown = 'markdown', .mdown = 'markdown'}}
vim.g.vimwiki_list = {{path = os.getenv( "WIKIHOME" ), syntax = 'markdown', ext = '.md'}}
vim.g.vimwiki_global_ext = 0
vim.g.instant_markdown_autostart = 0

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
