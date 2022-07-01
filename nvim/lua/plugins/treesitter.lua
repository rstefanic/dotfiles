require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "cpp", "php", "css", "html", "vue", "go" },
    highlight = {
        enable = true
    }
}

require'treesitter-context'.setup{
    enable = true,
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class',
            'function',
            'method',
        },
    },
}
