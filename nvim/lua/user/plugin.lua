vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Theme
    use { "catppuccin/nvim", as = "catppuccin" }

    use { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        requires = {
          -- Automatically install LSPs to stdpath for neovim
          'williamboman/mason.nvim',
          'williamboman/mason-lspconfig.nvim',

          -- Useful status updates for LSP
          { 'j-hui/fidget.nvim', tag = 'legacy' }
        },
    }

    use { -- Autocompletion
        'hrsh7th/nvim-cmp',
        requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    }

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

    use 'numToStr/Comment.nvim'

    -- Language Plugins
    use 'rust-lang/rust.vim'

    -- Fugitive
    use 'tpope/vim-fugitive'
    use 'airblade/vim-gitgutter'

    -- Tmux navigation integration
    use 'christoomey/vim-tmux-navigator'

    use 'tjdevries/sPoNGe-BoB.NvIm'
end)

