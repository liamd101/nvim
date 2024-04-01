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
local tex_utils = require('luasnip-helper-funcs')


return {
    s({ trig = "beg", dscr = "begin{} / end{}", snippetType="autosnippet" },

        fmt([[
            \begin{<>}
                <>
            \end{<>}
            ]],

        {
            i(1),
            i(0),
            rep(1)
        },

        { delimiters = "<>" }
        ),

        { condition = tex_utils.line_begin }
    ),

    s({ trig = "enum", dscr = "Enumerate", snippetType="autosnippet" },

        fmt([[
            \begin{enumerate}
                \item <>
            \end{enumerate}
            ]],

            { i(0) },

            { delimiters = "<>" }
            ),

        { condition = tex_utils.line_begin }
    ),

    s({ trig = "item", dscr = "Itemize", snippetType="autosnippet" },

        fmt([[
            \begin{itemize}
                \item <>
            \end{itemize}
            ]],

            { i(0) },

            { delimiters = "<>" }
            ),
        { condition = tex_utils.line_begin }
    ),

    s({ trig = "desc", dscr = "Description" },
        fmt([[
            \begin{description}
                \item<> <>
            \end{description}
            ]],

            {
                i(1),
                i(0)
            },

            { delimiters = "<>" }
            ),

        { condition = tex_utils.line_begin }
    ),

    s({ trig = "case", dscr = "Cases", snippetType="autosnippet" },
        fmt([[
            \begin{cases}
                <>
            \end{cases}
            ]],

            { i(0) },

            { delimiters = "<>" }
            ),
        { condition = tex_utils.line_begin }
    ),

    s({ trig = "prob", dscr = "Problem", snippetType="snippet" },
        fmt([[
            \begin{problem}{<>}
                <>
            \end{problem}
            ]],

            { i(1), i(0) },

            { delimiters = "<>" }
            ),
        { condition = tex_utils.line_begin }
    )
}

