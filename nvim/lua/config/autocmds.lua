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
