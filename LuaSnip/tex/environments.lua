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


local tex_utils = {}

tex_utils.line_begin = require("luasnip.extras.expand_conditions").line_begin
tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function()  -- comment detection
  return vim.fn['vimtex#syntax#in_comment']() == 1
end
tex_utils.in_env = function(name)  -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function()  -- equation environment detection
    return tex_utils.in_env('equation')
end
tex_utils.in_itemize = function()  -- itemize environment detection
    return tex_utils.in_env('itemize')
end

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


