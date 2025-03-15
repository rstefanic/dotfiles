return {
  {
    -- vim-prettier formatting
    'sbdchd/neoformat',
    config = function()
      -- Neoformat option to use project level prettier
      vim.g.neoformat_try_node_exe = 1
    end
  }
}
