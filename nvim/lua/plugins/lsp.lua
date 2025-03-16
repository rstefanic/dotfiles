local function on_attach(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-i>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      {
        'williamboman/mason-lspconfig.nvim',
        config = function()
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

          -- mason-lspconfig requires that these setup functions are called in this order
          -- before setting up the servers.
          require('mason').setup()
          require('mason-lspconfig').setup()

          -- Setup neovim lua configuration
          require('neodev').setup()

          -- Ensure the servers above are installed
          local mason_lspconfig = require 'mason-lspconfig'

          local servers = {
            clangd = {},
          }

          mason_lspconfig.setup {
            ensure_installed = vim.tbl_keys(servers),
          }

          mason_lspconfig.setup_handlers {
            function(server_name)
              require('lspconfig')[server_name].setup {
                capabilities = capabilities,
                on_attach = require('plugins.lsp').on_attach,
                settings = servers[server_name],
                filetypes = (servers[server_name] or {}).filetypes,
              }
            end,
          }
        end
      },
      { 'j-hui/fidget.nvim',       opts = {} },
      'folke/neodev.nvim',
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

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
            -- TODO: Add real path
            -- tsdk = '/path/to/node_modules/typescript/lib'
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

      -- Intelephense LSP configuration
      require('lspconfig').intelephense.setup({
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
        init_options = {
          licenceKey = '~/intelephense/licence.txt',
        },
        capabilities = capabilities,
      })
    end
  },
}
