-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'jensjpedersen/ranger_nvim'

  -- Lsp
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'hrsh7th/cmp-nvim-lsp'
  use 'williamboman/mason.nvim'

  -- Cmp
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'onsails/lspkind.nvim'
  use 'hrsh7th/cmp-nvim-lua'
  -- use {'tzachar/cmp-tabnine', run='./install.sh'}-- requires = 'hrsh7th/nvim-cmp'}
  use  "kdheepak/cmp-latex-symbols"

  -- For ultisnips users.
  use 'SirVer/ultisnips'
  use 'quangnguyen30192/cmp-nvim-ultisnips'

  -- Omnicompletion
  use 'hrsh7th/cmp-omni'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'          -- Requirement
  use 'BurntSushi/ripgrep'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'junegunn/fzf.vim'

  -- Vim extensions
  -- use 'justinmk/vim-sneak'             -- naviagation
  use 'ggandor/leap.nvim'
  use 'wellle/targets.vim'             -- better text objects
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'adelarsq/vim-matchit'
  use 'tpope/vim-unimpaired'
  use 'romainl/vim-qf' -- better quck fix

  -- Git 
  use 'tpope/vim-fugitive'             -- git plugin
  use 'lewis6991/gitsigns.nvim'

  -- Coding
  use 'benmills/vimux'                 -- vim tmux compatibility
  use 'nathanaelkane/vim-indent-guides'
  use 'christoomey/vim-tmux-navigator' -- Navigation between vim and tmux
  use 'yinflying/matlab.vim'
  use 'mattn/emmet-vim'
  use 'tpope/vim-dadbod' -- Interact with databases 
  use 'kristijanhusak/vim-dadbod-ui'
  use 'kristijanhusak/vim-dadbod-completion'
  use { 'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate' }

  -- Writing
  use 'lervag/vimtex'		           -- Latex
  use 'vimwiki/vimwiki'		           -- vimwiki
  -- use 'lervag/wiki.vim'
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Styling
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'mhinz/vim-startify'
  use 'rafi/awesome-vim-colorschemes'

  -- Tools
  use 'mbbill/undotree'
  use 'kyazdani42/nvim-tree.lua'
  use 'szw/vim-maximizer'
  use 'dhruvasagar/vim-table-mode'
  use 'preservim/tagbar'
  -- use 'liuchengxu/vista.vim'
  use 'kshenoy/vim-signature'
  use 'AndrewRadev/linediff.vim'
  -- Etc
  use {
      'glacambre/firenvim', -- Turn your browser into a nvimclient
      run = function() vim.fn['firenvim#install'](0) end 
  }
end)




