function keymap(mode, lhs, rhs, opts)
  vim.api.nvim_set_keymap(
    mode,
    lhs,
    rhs,
    vim.tbl_extend('keep', opts or {}, { noremap = true, silent = true })
  )
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Fugitive
keymap('n', '<leader>gs', '<cmd>Git<CR>');

-- Init edit and sourcing
keymap('n', '<leader>ve', ':edit ~/.config/nvim/init.lua<CR>')
keymap('n', '<leader>vs', ':source ~/.config/nvim/init.lua<CR>')

-- Remove highlighting
keymap('n', '<leader>h', ':noh<CR>')

-- Open nonexistent files
keymap('', 'gf', ':edit <cfile><CR>')

-- Reselect visual selection after indenting
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

-- Split windows
keymap('n', 'ss', ':split<Return><C-w>w')
keymap('n', 'sv', ':vsplit<Return><C-w>w')
keymap('n', 'sc', '<C-w>c')
keymap('n', 'so', '<C-w>o')

-- Resize windows with arrows
keymap('n', '<C-Up>', ':resize +2<CR>')
keymap('n', '<C-Down>', ':resize -2<CR>')
keymap('n', '<C-Left>', ':vertical resize -2<CR>')
keymap('n', '<C-Right>', ':vertical resize +2<CR>')

-- Move text up and down
keymap('n', '<C-j>', ':move .+1<CR>==')
keymap('n', '<C-k>', ':move .-2<CR>==')
keymap('i', '<C-j>', '<Esc>:move .+1<CR>==gi')
keymap('i', '<C-k>', '<Esc>:move .-2<CR>==gi')
keymap('x', '<C-j>', ":move '>+1<CR>gv-gv")
keymap('x', '<C-k>', ":move '<-2<CR>gv-gv")

-- Explorer
keymap('n', '<leader>pf', ':Ex<CR>');

-- Go commands
keymap('n', '<leader>gof', ':!go fmt .<CR>')
