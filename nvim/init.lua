require 'config.settings'
require 'config.lazy'
require 'config.keymaps'
require 'config.autocmds'

vim.cmd [[colorscheme distilled]]

-- Overwrite spelling highlights to be less noisy without underlines
vim.cmd([[
    hi SpellBad         ctermbg=NONE ctermfg=1    cterm=NONE      guibg=NONE     guifg=#e76d6d  gui=NONE
    hi SpellCap         ctermbg=NONE ctermfg=1    cterm=NONE      guibg=NONE     guifg=#e76d6d  gui=NONE
    hi SpellLocal       ctermbg=NONE ctermfg=9    cterm=NONE      guibg=NONE     guifg=#edbabf  gui=NONE
    hi SpellRare        ctermbg=NONE ctermfg=9    cterm=NONE      guibg=NONE     guifg=#edbabf  gui=NONE
]])
