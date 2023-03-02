require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'gopls', 'intelephense' },
}
