vim.opt.background = "dark"

-- Gruvbox Colors
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true, -- will make italic comments and special strings
  inverse = true, -- invert background for search, diffs, statuslines and errors
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  contrast = "hard",
  overrides = {},
})

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
