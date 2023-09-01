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


ls.add_snippets( "all", {
    s({ trig = "beg", desc = "begin{} / end{}", snippetType="autosnippet" },

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

    s({ trig = "enum", desc = "Enumerate", snippetType="autosnippet" },

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

    s({ trig = "item", desc = "Itemize", snippetType="autosnippet" },

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

    s({ trig = "desc", desc = "Description" },
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

})

require("luasnip.loaders.from_lua").load({ include = "all" })


