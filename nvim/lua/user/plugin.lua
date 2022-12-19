vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Copilot
    use 'github/copilot.vim'

    -- Theme
    use 'morhetz/gruvbox'
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

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
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
          pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }
    use { -- Additional text objects via treesitter
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }
    use 'nvim-treesitter/nvim-treesitter-context'

    -- Language Plugins
    use { 'yaegassy/coc-intelephense', run = 'yarn install --frozen-lockfile' }
    use 'rust-lang/rust.vim'

    -- Fugitive
    use 'tpope/vim-fugitive'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
end)
