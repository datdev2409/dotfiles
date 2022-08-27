-- Autocommand that reloads neovim whenever you save the plugins.lua file
local packer = require('packer');

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


return packer.startup(function()
  -- Packer
  use 'wbthomason/packer.nvim'
  
 -- Theme
  use 'olimorris/onedarkpro.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- LSP
  use 'neovim/nvim-lspconfig'
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"} -- hightlight code 
  use {"williamboman/nvim-lsp-installer",}  
  -- Autocomplete
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'windwp/nvim-autopairs'
  
  -- Snippets
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  
  -- UI component
   
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons',} -- file browser
  
  -- Telescope
  use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }}
 
  -- Mapping escape
  use "max397574/better-escape.nvim"
  
  -- Comment
  use { 'numToStr/Comment.nvim', }

  -- whichkey (keymapping)
  use "folke/which-key.nvim"

  -- hop (easymotion)
  use {
      'phaazon/hop.nvim', branch = 'v1', 
  }
-- init.lua
  use "lukas-reineke/indent-blankline.nvim"

  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  use 'lewis6991/gitsigns.nvim'
  -- tag = 'release' -- To use the latest release

-- Lua
  use "folke/zen-mode.nvim"


end)
