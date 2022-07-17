local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Programming Languages
-- Python
keymap("n", "<leader>pp", ":!python3 %<CR>", opts)
keymap("n", "<leader>pdb", ":terminal python3 %<CR>", opts)
keymap("n", "<leader>lpp", ":!clear; echo ''; python3 %<CR>", opts)
keymap("n", "<leader>lpdb", ":terminal clear; echo ''; python3 %<CR>", opts)
keymap("n", "<leader>ppt", ":!pytest<CR>", opts)

-- Rust
keymap("n", "<leader>rr", ":!echo ''; cargo run<CR>", opts)

-- Quickly close windows
-- keymap("n", "<leader>x", ":x<CR>", opts)
keymap("n", "<leader>x", ":x<CR>", opts)
keymap("n", "<leader>X", ":q<CR>", opts)

-- Switch between the last two files
keymap("n", "<leader><leader>", "<c-^>", opts)

-- Note that remapping C-s requires flow control to be disabled
-- (e.g. in .bashrc or .zshrc)
keymap("n", "<C-s>", "<ESC>:w<CR>", opts)
keymap("i", "<C-s>", "<ESC>:w<CR>", opts)

keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

keymap("n", "<leader>t", ":Format<CR><ESC>:5sleep<CR><ESC>:retab<CR>", opts)

-- Use enter to create new lines w/o entering insert mode
keymap("n", "<CR>", "o<ESC>", opts)


-- Use tab to jump between blocks, because it's easier
keymap("n", "<tab>", "%", opts)
keymap("v", "<tab>", "%", opts)
