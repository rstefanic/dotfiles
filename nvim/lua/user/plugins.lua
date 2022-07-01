local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('neoclide/coc.nvim', {['branch'] = 'master', ['do'] = 'yarn install --frozen-lockfile' })

-- Themes
Plug('ellisonleao/gruvbox.nvim')
Plug('folke/tokyonight.nvim', { ['branch'] = 'main' })
Plug('ayu-theme/ayu-vim')

-- Lualine
Plug('nvim-lualine/lualine.nvim')
Plug('kyazdani42/nvim-web-devicons');

-- Telescope
Plug('nvim-lua/plenary.nvim');
Plug('nvim-telescope/telescope-fzf-native.nvim', { run = 'make' });
Plug('nvim-telescope/telescope-live-grep-raw.nvim');
Plug('nvim-telescope/telescope.nvim');
Plug('kyazdani42/nvim-web-devicons');

-- Treesitter
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' });
Plug('nvim-treesitter/nvim-treesitter-context');

Plug('yaegassy/coc-intelephense', { ['do'] = 'yarn install --frozen-lockfile' });

Plug('tpope/vim-fugitive');

Plug('L3MON4D3/LuaSnip')

vim.call('plug#end')
