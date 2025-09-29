require 'config.settings'
require 'config.lazy'
require 'config.keymaps'
require 'config.autocmds'

vim.g.everforest_background = 'hard'
vim.cmd [[colorscheme everforest]]

-- Overwrite Everforest spelling highlights to be less noisy
vim.cmd([[
    let s:configuration = everforest#get_configuration()
    let s:palette = everforest#get_palette(s:configuration.background, s:configuration.colors_override)

    call everforest#highlight('SpellBad', s:palette.red, s:palette.none)
    call everforest#highlight('SpellCap', s:palette.blue, s:palette.none)
    call everforest#highlight('SpellLocal', s:palette.aqua, s:palette.none)
    call everforest#highlight('SpellRare', s:palette.purple, s:palette.none)
]])
