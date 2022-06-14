local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('neoclide/coc.nvim', {['branch'] = 'master', ['do'] = 'yarn install --frozen-lockfile' })

Plug('gruvbox-community/gruvbox');
Plug('folke/tokyonight.nvim', { ['branch'] = 'main' })

-- Telescope
Plug('nvim-lua/plenary.nvim');
Plug('kyazdani42/nvim-web-devicons');
Plug('nvim-telescope/telescope-fzf-native.nvim', { run = 'make' });
Plug('nvim-telescope/telescope-live-grep-raw.nvim');
Plug('nvim-telescope/telescope.nvim');
Plug('kyazdani42/nvim-web-devicons');

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' });
Plug('nvim-treesitter/nvim-treesitter-context');

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

require'treesitter-context'.setup{
    enable = true,
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class',
            'function',
            'method',
        },
    },
}

vim.opt.background = "dark" 
vim.cmd[[let g:gruvbox_contrast_dark = "hard"]]
vim.cmd[[colorscheme gruvbox]]
