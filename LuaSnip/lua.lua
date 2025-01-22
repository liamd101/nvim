local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local tex_utils = require('liamd.luasnip-helper-funcs')

return {
    s({ trig = "snip", dscr = "LuaSnip template" },
        fmt([[
            s({ trig = "<>", dscr = "<>", snippetType="<>" },
                <>
            ),
            <>
        ]],

        {
            i(1, "trig"),
            i(2, "description"),
            i(3, "snippet"),
            i(4),
            i(0)
        },

        { delimiters = "<>" }
        )
    )

}

