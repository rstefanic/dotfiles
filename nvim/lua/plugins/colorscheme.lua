return {
  {
    'Alligator/accent.vim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'accent'
      vim.g.accent_no_bg = 1

      -- Remove different SignColumn background color
      vim.api.nvim_set_hl(0, 'SignColumn', { guibg=NONE })
    end,
  }
}
