return {
  {
    'echasnovski/mini.nvim',
    enabled = true,
    config = function()
      require('mini.statusline').setup()
    end
  },
}
