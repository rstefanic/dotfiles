local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('neoclide/coc.nvim', {['branch'] = 'master', ['do'] = 'yarn install --frozen-lockfile' })

Plug('sainnhe/everforest');

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

vim.call('plug#end')

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "cpp", "php", "css", "html", "vue" },
    highlight = {
        enable = true
    }
}

vim.cmd("let g:everforest_background = 'hard'");
vim.cmd("let g:everforest_better_performance = 1");
vim.cmd('colorscheme everforest')
