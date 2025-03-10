return {
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

      require('oil').setup {
        default_file_explorer = true,
        keymaps = {
          ["<C-h>"] = false,
        },
        view_options = {
          show_hidden = true,
          is_hidden_file = function(name, bufnr)
            local m = name:match("^%.")
            return m ~= nil
          end
        }
      }
    end
  }
}
