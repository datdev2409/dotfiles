return require('packer').startup(function()
  -- Packer
  use 'wbthomason/packer.nvim'
  
  -- Theme
  use 'sainnhe/everforest'
  use 'navarasu/onedark.nvim'
  -- LSP
  use 'neovim/nvim-lspconfig'
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"} -- hightlight code 
  
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
  use "terrortylor/nvim-comment"

  -- whichkey (keymapping)
  use "folke/which-key.nvim"

  -- hop (easymotion)
  use {
      'phaazon/hop.nvim', branch = 'v1', 
  }
end)
