return {
  {
    'shaunsingh/nord.nvim',
    priority = 1000,
    config = function()
      vim.g.nord_italic = false
      vim.cmd.colorscheme 'nord'
    end,
  }
}
