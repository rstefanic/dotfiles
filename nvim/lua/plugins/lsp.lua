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

local function setup_autoformatting()
  -- Switch for controlling whether you want autoformatting.
  --  Use :FormatToggle to toggle autoformatting on or off
  local format_is_enabled = true
  vim.api.nvim_create_user_command('FormatToggle', function()
    format_is_enabled = not format_is_enabled
    print('FormatToggle: ' .. tostring(format_is_enabled))
  end, {})

  -- Create an augroup that is used for managing our formatting autocmds.
  --      We need one augroup per client to make sure that multiple clients
  --      can attach to the same buffer without interfering with each other.
  local _augroups = {}
  local get_augroup = function(client)
    if not _augroups[client.id] then
      local group_name = 'lsp-format-' .. client.name
      local id = vim.api.nvim_create_augroup(group_name, { clear = true })
      _augroups[client.id] = id
    end

    return _augroups[client.id]
  end

  -- Whenever an LSP attaches to a buffer, we will run this function.
  -- See `:help LspAttach` for more information about this autocmd event.
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach-format', { clear = true }),
    -- This is where we attach the autoformatting for reasonable clients
    callback = function(args)
      local client_id = args.data.client_id
      local client = vim.lsp.get_client_by_id(client_id)
      local bufnr = args.buf

      if client == nil then
        return
      end

      client.server_capabilities.semanticTokensProvider = nil

      -- Only attach to clients that support document formatting
      if not client.server_capabilities.documentFormattingProvider then
        return
      end

      -- These autoformatters with LSP suck :(
      -- Using prettier...
      if client.name == 'ts_ls' or client.name == 'volar' then
        return
      end

      -- Create an autocmd that will run *before* we save the buffer.
      --  Run the formatting command for the LSP that has just attached.
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = get_augroup(client),
        buffer = bufnr,
        callback = function()
          if not format_is_enabled then
            return
          end

          vim.lsp.buf.format {
            async = false,
            filter = function(c)
              return c.id == client.id
            end,
          }
        end,
      })
    end,
  })
end

return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      inlay_hints = { enabled = false },
    },
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

          -- Setup neovim lua configuration
          require('lazydev').setup()

          local servers = {
            clangd = {},
            -- Vue 3
            volar = {},
            -- TypeScript
            ts_ls = {
              filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
              init_options = {
                plugins = {
                  {
                    name = '@vue/typescript-plugin',
                    location = vim.fn.stdpath 'data' ..
                        '/mason/packages/vue-language-server/node_modules/@vue/language-server',
                    languages = { 'vue' },
                  },
                },
              },
            },
          }

          local mason_lspconfig = require('mason-lspconfig')
          -- Call setup but don't install/enable anything; we'll manually register the servers
          mason_lspconfig.setup({
            automatic_enable = false,
            automatic_installation = false,
            ensure_installed = {},
          })

          for server_name, server_config in pairs(servers) do
            vim.lsp.config(server_name, {
              capabilities = capabilities,
              settings = server_config,
              filetypes = server_config.filetypes,
            })
            vim.lsp.enable(server_name)
          end
        end
      },
      { 'j-hui/fidget.nvim',       opts = {} },
      'folke/lazydev.nvim',
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      vim.lsp.enable('hls')

      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        }
      })
      vim.lsp.enable('lua_ls')

      vim.lsp.config('volar', {
        filetypes = { 'vue' },
        init_options = {
          vue = {
            hybridMode = true,
          },
          typescript = {
            -- tsdk will be set by on_init based on project root
          }
        },
        on_init = function(client)
          local lib_path = vim.fs.find('node_modules/typescript/lib', { path = client.root_dir, upward = true })[1]
          if lib_path then
            client.config.init_options.typescript.tsdk = lib_path
          end
        end,
      })
      vim.lsp.enable('volar')

      vim.lsp.config('ts_ls', {
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
      })
      vim.lsp.enable('ts_ls')

      -- Intelephense LSP configuration
      vim.lsp.config('intelephense', {
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
      vim.lsp.enable('intelephense')

      vim.lsp.enable('nil_ls')

      setup_autoformatting()
    end
  },
}
