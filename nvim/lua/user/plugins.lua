vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Theme
    use 'morhetz/gruvbox'

    -- COC
    use { 'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile' }

    -- Lualine
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- Telescope
    use 'nvim-lua/plenary.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'nvim-telescope/telescope-live-grep-raw.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-context'

    -- Language Plugins
    use { 'yaegassy/coc-intelephense', run = 'yarn install --frozen-lockfile' }
    use 'rust-lang/rust.vim'

    -- Fugitive
    use 'tpope/vim-fugitive'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
end)
