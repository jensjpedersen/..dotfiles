-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager

  -- Lsp
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'hrsh7th/cmp-nvim-lsp'

  -- Cmp
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- For vsnip users.
  -- use 'hrsh7th/cmp-vsnip'
  -- use 'hrsh7th/vim-vsnip'

  -- For luasnip users.
  -- use 'L3MON4D3/LuaSnip'
  -- use 'saadparwaiz1/cmp_luasnip'

  -- For ultisnips users.
  use 'SirVer/ultisnips'
  use 'quangnguyen30192/cmp-nvim-ultisnips'

  -- For snippy users.
  -- use 'dcampos/nvim-snippy'
  -- use 'dcampos/cmp-snippy'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'          -- Requirement
  use 'BurntSushi/ripgrep'
  use 'nvim-telescope/telescope-fzf-native.nvim'

  -- Vim extensions
  use 'justinmk/vim-sneak'             -- naviagation
  use 'wellle/targets.vim'             -- better text objects
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'

  -- Git 
  use 'tpope/vim-fugitive'             -- git plugin

  -- Coding
  use 'benmills/vimux'                 -- vim tmux compatibility
  use 'yinflying/matlab.vim'
  use 'nathanaelkane/vim-indent-guides'
  use 'christoomey/vim-tmux-navigator' -- Navigation between vim and tmux

  -- Writing
  use 'lervag/vimtex'		           -- Latex
  use 'vimwiki/vimwiki'		           -- vimwiki


  -- Tools
  use 'mbbill/undotree'
  use 'szw/vim-maximizer'
  use 'dhruvasagar/vim-table-mode'
  use 'preservim/tagbar'
  use 'mattn/emmet-vim'

  use 'mhinz/vim-startify'             -- start page
end)



