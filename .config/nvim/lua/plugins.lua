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

  -- For ultisnips users.
  use 'SirVer/ultisnips'
  use 'quangnguyen30192/cmp-nvim-ultisnips'

  -- Omnicompletion
  use 'hrsh7th/cmp-omni'

  -- Colorschemes
  use 'rafi/awesome-vim-colorschemes'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'          -- Requirement
  use 'BurntSushi/ripgrep'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  -- Vim extensions
  use 'justinmk/vim-sneak'             -- naviagation
  use 'wellle/targets.vim'             -- better text objects
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'

  -- Git 
  use 'tpope/vim-fugitive'             -- git plugin
  use 'lewis6991/gitsigns.nvim'

  -- Coding
  use 'benmills/vimux'                 -- vim tmux compatibility
  use 'nathanaelkane/vim-indent-guides'
  use 'christoomey/vim-tmux-navigator' -- Navigation between vim and tmux
  use 'yinflying/matlab.vim'
  use 'mattn/emmet-vim'
  use 'hrsh7th/cmp-nvim-lua'

  -- Writing
  use 'lervag/vimtex'		           -- Latex
  use 'vimwiki/vimwiki'		           -- vimwiki
  use 'vigoux/LanguageTool.nvim'
--  use 'rhysd/vim-grammarous'

 -- Styling
 use 'nvim-lualine/lualine.nvim'
 use 'kyazdani42/nvim-web-devicons'
 use 'mhinz/vim-startify'

 -- Tools
 use 'mbbill/undotree'
 use 'kyazdani42/nvim-tree.lua'
 use 'szw/vim-maximizer'
 use 'dhruvasagar/vim-table-mode'
 use 'preservim/tagbar'
end)



