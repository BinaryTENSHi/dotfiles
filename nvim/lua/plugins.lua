return require('packer').startup(function()
  -- Packer can manage itself
  use {
    'wbthomason/packer.nvim',
    opt = true
  }

  -- Theme
  use 'vim-airline/vim-airline'
  use {
    'vim-airline/vim-airline-themes',
    config = function()
      vim.g.airline_theme = 'luna'
    end
  }

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- Tree Sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
end)
