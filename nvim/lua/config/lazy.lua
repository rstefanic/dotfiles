local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

-- Put lazy in the runtime path
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { 'mrjones2014/smart-splits.nvim' },

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Super important plugins
  'tjdevries/sPoNGe-BoB.NvIm',

  -- Tmux navigation
  'christoomey/vim-tmux-navigator',

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',        opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  require 'plugins.treesitter',
  require 'plugins.lsp',
  require 'plugins.autoformat',
  require 'plugins.git',
  require 'plugins.colorscheme',
  require 'plugins.mini',
  require 'plugins.which-key',
  require 'plugins.oil',
  require 'plugins.neoformat',
  require 'plugins.telescope',

}, {})
