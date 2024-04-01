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
    s({ trig = "=>", dscr = "Implies", snippetType = "autosnippet" },
        t("\\implies")
    ),

    s({ trig = "=<", dscr = "Implied by", snippetType = "autosnippet" },
        t("\\impliedby")
    ),

    s({ trig = "iff", dscr = "If and only if", snippetType = "autosnippet" },
        t("\\iff")
    ),

    s({ trig = "OO", dscr = "Empty set", snippetType = "autosnippet" },
        t("\\O")
    ),

    s({ trig = "RR", dscr = "Real", snippetType = "autosnippet" },
        t("\\R")
    ),

    s({ trig = "QQ", dscr = "Rational", snippetType = "autosnippet" },
        t("\\Q")
    ),

    s({ trig = "NN", dscr = "Natural", snippetType = "autosnippet" },
        t("\\N")
    ),

    s({ trig = "ZZ", dscr = "Pos-int", snippetType = "autosnippet" },
        t("\\Z")
    ),

    s({ trig = "dm", dscr = "Math", snippetType = "autosnippet" },
        fmt([[
            \[
                <>
            .\]<>
            ]],

            {
                i(1),
                i(0),
            },

            { delimiters = "<>" }
        ),
        { condition = tex_utils.line_begin }
    ),

    s({ trig = "mk", dscr = "Inline Math", snippetType = "autosnippet" },
        fmt([[
            $<>$<>
            ]],

            {
                i(1),
                i(0),
            },

            { delimiters = "<>" }
        )
    ),

    s({ trig = "ali", dscr = "Align", snippetType = "autosnippet" },
        fmt([[
            \begin{align*}
                <>
            .\end{align*}<>
            ]],

            {
                i(1),
                i(0),
            },

            { delimiters = "<>" }
        )
    ),

    s({ trig = "cc", dscr = "Subset", snippetType = "autosnippet" },
        t("\\subseteq"),
        { condition = tex_utils.in_mathzone }
    ),

    s({ trig = "//", dscr = "Fraction", snippetType = "autosnippet" },
        fmt([[\frac{<>}{<>}<>]],

            {
                i(1),
                i(2),
                i(0),
            },

            { delimiters = "<>" }
        ),
        { condition = tex_utils.in_mathzone }
    ),

    s({ trig = "==", dscr = "Equals", snippetType = "autosnippet" },
        fmt([[&= <> \\]],
            { i(1) },
            { delimiters = "<>" })
    ),

    s({ trig = "!=", dscr = "Not Equals", snippetType = "autosnippet" },
        t("\\neq")
    ),

    s({ trig = "bmat", dscr = "Matrix", snippetType = "autosnippet" },
        fmt([[
            \begin{bmatrix}
                <>
            \end{bmatrix}<>
                ]],

            { i(1), i(0) },

            { delimiters = "<>" })
    ),

    s({ trig = "()", dscr = "left( right)", snippetType = "autosnippet" },
        fmt([[\left( <> \right) <>]],

            { i(1), i(0) },

            { delimiters = "<>" }),

        { condition = tex_utils.in_mathzone }
    ),

    s({ trig = "sr", dscr = "Square", snippetType = "autosnippet" },
        t("^2"),

        { condition = tex_utils.in_mathzone }
    ),

    s({ trig = "cb", dscr = "Cube", snippetType = "autosnippet" },
        t("^3"),

        { condition = tex_utils.in_mathzone }
    ),

    s({ trig = "__", dscr = "Subscript", snippetType = "autosnippet" },
        fmt([[_{<>} <>]], { i(1), i(0) }, { delimiters = "<>" }),

        { condition = tex_utils.in_mathzone }
    ),

    s({ trig = "inn", dscr = "In set", snippetType = "autosnippet" },
        t("\\in"),

        { condition = tex_utils.in_mathzone }
    ),

    s({ trig = "ooo", dscr = "Infinity", snippetType = "autosnippet" },
        t("\\infty"),

        { condition = tex_utils.in_mathzone }
    ),

    s({ trig = "td", dscr = "To the ... power", snippetType = "autosnippet" },
        fmt([[^{<>}<>]], { i(1), i(0) }, { delimiters = "<>" }),

        { condition = tex_utils.in_mathzone }
    ),

    s({ trig = "<=", dscr = "less than or equal to", snippetType = "autosnippet" },
        t("\\le"),

        { condition = tex_utils.in_mathzone }
    ),

    s({ trig = ">=", dscr = "greater than or equal to", snippetType = "autosnippet" },
        t("\\ge"),

        { condition = tex_utils.in_mathzone }
    ),

    s({ trig = "lr", dscr = "left( right)", snippetType = "snippet" },
        fmt([[\left( <> \right) <>]], { i(1), i(0) }, { delimiters = "<>" })
    ),

    s({ trig = "lr(", dscr = "left( right)", snippetType = "snippet" },
        fmt([[\left( <> \right) <>]], { i(1), i(0) }, { delimiters = "<>" })
    ),

    s({ trig = "floor", dscr = "floor", snippetType = "autosnippet" },
        fmt([[\left\lfloor <> \right\rfloor <>]], { i(1), i(0) }, { delimiters = "<>" }),
        { condition = tex_utils.in_mathzone() }
    ),

    s({ trig = "ceil", dscr = "ceil", snippetType = "autosnippet" },
        fmt([[\left\lceil <> \right\rceil <>]], { i(1), i(0) }, { delimiters = "<>" }),
        { condition = tex_utils.in_mathzone() }
    ),

    s({ trig = "lr|", dscr = "left| right|", snippetType = "snippet" },
        fmt([[\left| <> \right| <>]], { i(1), i(0) }, { delimiters = "<>" })
    ),

    s({ trig = "lr{", dscr = "left{ right}", snippetType = "snippet" },
        fmt([[\left{ <> \right} <>]], { i(1), i(0) }, { delimiters = "<>" })
    ),

    s({ trig = "lrb", dscr = "left{ right}", snippetType = "snippet" },
        fmt([[\left{ <> \right} <>]], { i(1), i(0) }, { delimiters = "<>" })
    ),

    s({ trig = "lr[", dscr = "left[ right]", snippetType = "snippet" },
        fmt([[\left[ <> \right] <>]], { i(1), i(0) }, { delimiters = "<>" })
    ),

    s({ trig = "rd", dscr = "to the ... power", snippetType = "autosnippet" },
        fmt([[^{(<>)}<>]], { i(1), i(0) }, { delimiters = "<>" }),
        { condition = tex_utils.in_mathzone() }
    ),

    s({ trig = "sq", dscr = "sqrt{}", snippetType = "autosnippet" },
        fmt([[\sqrt{<>} <>]], { i(1), i(0) }, { delimiters = "<>" }),
        { condition = tex_utils.in_mathzone() }
    ),

    s({ trig = "ooo", dscr = "infty", snippetType = "autosnippet" },
        t("\\infty"),
        { condition = tex_utils.in_mathzone() }
    ),

    s({ trig = "yii", dscr = "yi", snippetType = "autosnippet" },
        t("y_{i}"),
        { condition = tex_utils.in_mathzone() }
    ),

    s({ trig = "xii", dscr = "xi", snippetType = "autosnippet" },
        t("x_{i}"),
        { condition = tex_utils.in_mathzone() }
    ),

    s({ trig = "yjj", dscr = "yj", snippetType = "autosnippet" },
        t("y_{j}"),
        { condition = tex_utils.in_mathzone() }
    ),

    s({ trig = "xjj", dscr = "xj", snippetType = "autosnippet" },
        t("x_{j}"),
        { condition = tex_utils.in_mathzone() }
    ),

    s({ trig = "ynn", dscr = "yn", snippetType = "autosnippet" },
        t("y_{n}"),
        { condition = tex_utils.in_mathzone() }
    ),

    s({ trig = "xnn", dscr = "xn", snippetType = "autosnippet" },
        t("x_{n}"),
        { condition = tex_utils.in_mathzone() }
    ),

    s({ trig = "xmm", dscr = "xm", snippetType = "autosnippet" },
        t("x_{m}"),
        { condition = tex_utils.in_mathzone() }
    ),

    s({ trig = "xp1", dscr = "x_{p+1}", snippetType = "autosnippet" },
        t("x_{n+1}"),
        { condition = tex_utils.in_mathzone() }
    ),

    s({ trig = "<<", dscr = "<<", snippetType = "autosnippet" },
        t("\\ll")
    ),

    s({ trig = ">>", dscr = ">>", snippetType = "autosnippet" },
        t("\\gg")
    ),

    s({ trig = "pmat", dscr = "pmat", snippetType = "autosnippet" },
        fmt([[\begin{pmatrix} <> \end{pmatrix} <>]], { i(1), i(0) }, { delimiters = "<>" })
    ),

    s({ trig = "sum", dscr = "Sum", snippetType = "snippet" },
        fmt(
            [[\sum_{n=<>}^{<>} <>]],
            { i(1, "1"), i(2, "\\infty"), i(0, "a_n z^n") },
            { delimiters = "<>" }
        )
    ),

    s({ trig = "lim", dscr = "Limit", snippetType = "snippet" },
        fmt(
            [[\lim_{<> \to <>}]],
            { i(1, "n"), i(0, "\\infty") },
            { delimiters = "<>" }
        )
    ),

    s({ trig = "limsup", dscr = "Limsup", snippetType = "snippet" },
        fmt(
            [[\limsup_{<> \to <>}]],
            { i(1, "n"), i(0, "\\infty") },
            { delimiters = "<>" }
        )
    ),

    s({ trig = "prod", dscr = "Product", snippetType = "snippet" },
        fmt(
            [[\prod_{<>}<>]],
            { i(1, "n"), i(0, "\\infty") },
            { delimiters = "<>" }
        )
    ),

}
