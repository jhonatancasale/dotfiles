local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the {{ this }} file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost manager.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Mandatory-ish
  use "wbthomason/packer.nvim"                  -- Have packer manage itself
  use "nvim-lua/popup.nvim"                     -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"                   -- Useful lua functions used ny lots of plugins
  use "kyazdani42/nvim-web-devicons"            -- Provide fancy and useful icons

  -- Colorschemes
  use "gruvbox-community/gruvbox"               -- The de facto default colorscheme

  -- cmp plugins
  use "hrsh7th/nvim-cmp"                        -- The completion plugin
  use "hrsh7th/cmp-buffer"                      -- buffer completions
  use "hrsh7th/cmp-path"                        -- path completions
  use "hrsh7th/cmp-cmdline"                     -- cmdline completions
  use "saadparwaiz1/cmp_luasnip"                -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"                    -- use cmp with LSP
  use "f3fora/cmp-spell"                        -- spell source for nvim-cmp based on vim's spellsuggest
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip"                        -- snippet engine
  use "rafamadriz/friendly-snippets"            -- a bunch of snippets to use

  -- LSP
  -- use "neovim/nvim-lspconfig"                   -- enable LSP
  -- use "williamboman/nvim-lsp-installer"         -- simple to use language server installer
  -- use "tamago324/nlsp-settings.nvim"            -- language server settings defined in json for
  -- use "jose-elias-alvarez/null-ls.nvim"         -- for formatters and linters

  -- Telescope
  -- use "nvim-telescope/telescope.nvim"
  --
  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Utilities
  use "vimwiki/vimwiki"                         -- Wiki language provider for vim
  use "lewis6991/gitsigns.nvim"                 -- Provide visual clues about git events




















  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
