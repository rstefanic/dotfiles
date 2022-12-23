require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'sumneko_lua', 'gopls', 'intelephense' },
}
