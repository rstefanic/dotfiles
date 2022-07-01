vim.opt.background = "dark"

-- Gruvbox Colors
vim.g.gruvbox_invert_selection = '0'
vim.g.gruvbox_italics = 1

-- Tokyonight colors
vim.g.tokyonight_transparent = true
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

vim.cmd[[colorscheme gruvbox]]

-- Transparent Background
vim.api.nvim_set_hl(0, "Normal", {
    bg = "none"
})
