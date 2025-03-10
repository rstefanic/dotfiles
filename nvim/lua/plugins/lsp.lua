return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim',       opts = {} },
      'folke/neodev.nvim',
    },
    config = function()
      require('lspconfig').lua_ls.setup {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        }
      }

      require('lspconfig')['hls'].setup {
        filetypes = { 'haskell', 'lhaskell', 'cabal' }
      }

      require('lspconfig').volar.setup {
        filetypes = { 'vue ' },
        init_options = {
          vue = {
            hybridMode = true,
          },
          typescript = {
            --
            tsdk = '/path/to/node_modules/typescript/lib'
          }
        },
        -- Use a local server and fall back to a global TypeScript Server installation
        on_new_config = function(new_config, new_root_dir)
          local lib_path = vim.fs.find('node_modules/typescript/lib', { path = new_root_dir, upward = true })[1]
          if lib_path then
            new_config.init_options.typescript.tsdk = lib_path
          end
        end,
      }

      require('lspconfig').ts_ls.setup {
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
              languages = { "javascript", "typescript", "vue" },
            },
          },
        },
        filetypes = {
          "javascript",
          "typescript",
          "vue",
        },
      }
    end
  },
}
