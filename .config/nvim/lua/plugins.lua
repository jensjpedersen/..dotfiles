-- Bootstrapping packer.nvim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'wbthomason/packer.nvim' -- Package manager
  -- use 'jensjpedersen/ranger_nvim'
  use '~/Projects/ranger_nvim'
  use '~/Projects/NvimOpenAI/'
  use '~/Projects/scim.nvim/'
  -- use 'jensjpedersen/openai_nvim'

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
  use {
      'ldelossa/gh.nvim',
      requires = { { 'ldelossa/litee.nvim' } }
  }
  use 'sindrets/diffview.nvim'


  -- Debugging
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'mfussenegger/nvim-dap-python'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'theHamsta/nvim-dap-virtual-text'

  -- Coding
  use 'benmills/vimux'                 -- vim tmux compatibility
  -- use 'nathanaelkane/vim-indent-guides'
  use 'christoomey/vim-tmux-navigator' -- Navigation between vim and tmux
  use 'yinflying/matlab.vim'
  use 'mattn/emmet-vim'
  use 'tpope/vim-dadbod' -- Interact with databases 
  use 'kristijanhusak/vim-dadbod-ui'
  use 'kristijanhusak/vim-dadbod-completion'
  use 'vim-test/vim-test'
  use { 'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-context'

  -- Writing
  use 'lervag/vimtex'		           -- Latex
  -- use 'vimwiki/vimwiki'		           -- vimwiki
  -- use 'jensjpedersen/vimwiki_fork'
  use '~/Projects/vimwiki_fork'		           -- vimwiki

  -- use 'jbyuki/nabla.nvim'

  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Styling
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'mhinz/vim-startify'
  use 'rafi/awesome-vim-colorschemes'
  use 'folke/tokyonight.nvim'
  use 'sainnhe/gruvbox-material'
  use 'sainnhe/sonokai'
  use "lukas-reineke/indent-blankline.nvim"
  use 'mechatroner/rainbow_csv'

  -- Tools
  --
  use 'folke/todo-comments.nvim'
  use 'mbbill/undotree'
  use 'kyazdani42/nvim-tree.lua'
  use 'szw/vim-maximizer'
  use 'dhruvasagar/vim-table-mode'
  use 'preservim/tagbar'
  -- use 'liuchengxu/vista.vim'
  use 'kshenoy/vim-signature'
  use 'AndrewRadev/linediff.vim'
  -- use 'Exafunction/codeium.vim'
  -- Etc
  -- use {
  --     'glacambre/firenvim', -- Turn your browser into a nvimclient
  --     run = function() vim.fn['firenvim#install'](0) end
  -- }
  --
  -- AI
  -- use({
  --     "jackMort/ChatGPT.nvim",
  --     config = function()
  --         require("chatgpt").setup()
  --     end,
  --     requires = {
  --         "MunifTanjim/nui.nvim",
  --         "nvim-lua/plenary.nvim",
  --         "nvim-telescope/telescope.nvim"
  --     }
  -- })

  -- use 'Bryley/neoai.nvim'
  --
  if packer_bootstrap then
    require('packer').sync()
  end

end)







