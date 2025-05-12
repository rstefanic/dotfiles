return {
  {
    'Alligator/accent.vim',
    priority = 1000,
    config = function()
      vim.g.accent_colour = 'blue'
      vim.cmd.colorscheme 'accent'

      -- Remove different SignColumn background color
      vim.api.nvim_set_hl(0, 'SignColumn', { guibg = NONE })
    end,
  }
}
