local ls = require"luasnip"
local i = ls.insert_node
local t = ls.text_node

ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI"
}

ls.add_snippets("typescript", {
    ls.snippet("cl", {
        t("console.log("), i(1, ""), t(");"), i(0, "")
    });

    ls.snippet("func", {
        t("function "), i(1, "name"), t("("), i(2, "arguments"), t({") {", ""}),
        i(0, ""),
        t({"", "}"})
    });
})

