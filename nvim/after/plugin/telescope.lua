vim.keymap.set('n', '<leader>pd', function()
    require('telescope.builtin').git_files({ use_git_root = true })
end, { desc = 'All Files' })

vim.keymap.set('n', '<leader>sf', function()
    require('telescope.builtin').find_files({ no_ignore = true, hidden = true, prompt_tile = 'Search Files' })
end, { desc = 'Search Files' })

vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'Search word' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'Search w/ Grep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'Search Diagnostics' })
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'Recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = 'Open buffers' })

vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Search in current buffer' })


require('telescope').setup({
    defaults = {
        layout_config = {
            prompt_position = 'top',
        },
        sorting_strategy = 'ascending',
    }
})
