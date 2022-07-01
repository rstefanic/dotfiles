local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('neoclide/coc.nvim', {['branch'] = 'master', ['do'] = 'yarn install --frozen-lockfile' })

-- Themes
Plug('gruvbox-community/gruvbox')
Plug('folke/tokyonight.nvim', { ['branch'] = 'main' })
Plug('ayu-theme/ayu-vim')

-- Telescope
Plug('nvim-lua/plenary.nvim');
Plug('kyazdani42/nvim-web-devicons');
Plug('nvim-telescope/telescope-fzf-native.nvim', { run = 'make' });
Plug('nvim-telescope/telescope-live-grep-raw.nvim');
Plug('nvim-telescope/telescope.nvim');
Plug('kyazdani42/nvim-web-devicons');

-- Treesitter
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' });
Plug('nvim-treesitter/nvim-treesitter-context');

Plug('yaegassy/coc-intelephense', { ['do'] = 'yarn install --frozen-lockfile' });

Plug('tpope/vim-fugitive');

Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')

Plug('L3MON4D3/LuaSnip')

vim.call('plug#end')

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "cpp", "php", "css", "html", "vue", "go" },
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

-- Load the colorscheme
vim.opt.background = "dark"
vim.g.gruvbox_invert_selection = '0'
vim.g.tokyonight_transparent = true
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
vim.g.gruvbox_italics = 1
vim.cmd[[colorscheme gruvbox]]

-- Transparent Background
vim.api.nvim_set_hl(0, "Normal", {
    bg = "none"
})
