-- Transparent Background
vim.api.nvim_set_hl(0, "Normal", {
    bg = "none"
})

vim.g.gruvbox_invert_selection = 0
vim.g.gruvbox_italicize_strings = 1

vim.cmd.colorscheme("gruvbox");
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
