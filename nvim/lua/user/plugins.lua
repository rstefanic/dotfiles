local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('neoclide/coc.nvim', {['branch'] = 'master', ['do'] = 'yarn install --frozen-lockfile' })

Plug('folke/tokyonight.nvim', { ['branch'] = 'main' })

-- Telescope
Plug('nvim-lua/plenary.nvim');
Plug('kyazdani42/nvim-web-devicons');
Plug('nvim-telescope/telescope-fzf-native.nvim', { run = 'make' });
Plug('nvim-telescope/telescope-live-grep-raw.nvim');
Plug('nvim-telescope/telescope.nvim');
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' });
Plug('kyazdani42/nvim-web-devicons');

Plug('yaegassy/coc-intelephense', { ['do'] = 'yarn install --frozen-lockfile' });

Plug('tpope/vim-fugitive');

Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')

vim.call('plug#end')

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "cpp", "php", "css", "html", "vue" },
    highlight = {
        enable = true
    }
}

vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

vim.cmd[[colorscheme tokyonight]]
