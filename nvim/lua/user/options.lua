-- General
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.title = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.confirm = true
vim.opt.updatetime = 250          -- Decrease CursorHold delay
vim.opt.redrawtime = 10000        -- Allow more time for loading syntax on large files
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.showmode = false
vim.opt.hlsearch = false
vim.opt.signcolumn = 'yes'
vim.opt.wildmode = 'longest:full,full'
vim.opt.guicursor = "i:blinkon1"

-- Tabs and what not
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.breakindent = true

-- Other text fun
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = 'tab:▸ ,trail:·'
vim.opt.fillchars = 'eob: '

-- Backup, undo, and swap files
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.swapfile = false

-- Opening a PHP file will turn off autoindent and smartindent because the default PHP indentation
-- plugin sets indentexpr and overrides these settings. This overwrites the default indentation
-- plugin settings and resets smartindent and autoindent back to the way I like it. :)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "php",
    callback = function()
        vim.opt.smartindent = true
        vim.opt.autoindent = true
    end
});
