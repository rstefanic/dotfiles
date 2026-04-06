vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

local function keymap(mode, lhs, rhs, opts)
  vim.api.nvim_set_keymap(
    mode,
    lhs,
    rhs,
    vim.tbl_extend('keep', opts or {}, { noremap = true, silent = true })
  )
end

-- Fugitive
keymap('n', '<leader>gs', '<cmd>Git<CR>');
keymap('n', '<leader>gh', '<cmd>0Gclog<CR>');

-- Rhubarb
keymap('n', '<leader>gp', '<cmd>GBrowse<CR>');

-- Document read mode
keymap('n', '<leader>dr', ':set wrap linebreak nolist textwidth=0<CR>')

-- Reselect visual selection after indenting
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

-- Split windows
keymap('n', 'ss', ':split<Return><C-w>w')
keymap('n', 'sv', ':vsplit<Return><C-w>w')

-- JQ format JSON
keymap('n', '<leader>jf', ":%!jq '.'<CR>")

-- Disable LSP autoformatting. `FormatToggle` is a custom command defined in lsp.lua.
keymap('n', '<leader>tf', '<cmd>FormatToggle<CR>', { desc = '[T]oggle [F]ormat on save' })
