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
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Super important plugins
  'tjdevries/sPoNGe-BoB.NvIm',

  -- Tmux navigation
  'christoomey/vim-tmux-navigator',

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  require 'plugins.treesitter',
  require 'plugins.cmp',
  require 'plugins.lsp',
  require 'plugins.git',
  require 'plugins.colorscheme',
  require 'plugins.supermaven',
  require 'plugins.mini',
  require 'plugins.which-key',
  require 'plugins.oil',
  require 'plugins.neoformat',
  require 'plugins.telescope',
  require 'plugins.smart-splits',

}, {})
