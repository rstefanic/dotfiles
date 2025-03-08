vim.api.nvim_create_autocmd('filetype', {
  pattern = 'netrw',
  desc = 'Remove <c-l> and <c-h> bindings in netrw',
  callback = function()
    vim.keymap.set('n', '<c-h>', require('smart-splits').move_cursor_left, {noremap = true, buffer = true, silent = true})
    vim.keymap.set('n', '<c-l>', require('smart-splits').move_cursor_right, {remap = true, buffer = true, silent = true})
  end
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.vue" },
  command = "Neoformat prettier",
})

-- Opening a PHP file will turn off autoindent and smartindent because the default PHP indentation
-- plugin sets indentexpr and overrides these settings. This overwrites the default indentation
-- plugin settings and resets smartindent and autoindent back to the way I like it. :)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "php",
    callback = function()
        vim.opt.smartindent = true
        vim.opt.autoindent = true
    end
});

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
