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
    s({ trig = "=>", dscr = "Implies", snippetType="autosnippet" },
        t("\\implies")
    ),

    s({ trig = "=<", dscr = "Implied by", snippetType="autosnippet" },
        t("\\impliedby")
    ),

    s({ trig = "iff", dscr = "If and only if", snippetType="autosnippet" },
        t("\\iff")
    ),

    s({ trig = "OO", dscr = "Empty set", snippetType="autosnippet" },
        t("\\O")
    ),

    s({ trig = "RR", dscr = "Real", snippetType="autosnippet" },
        t("\\R")
    ),
    
    s({ trig = "QQ", dscr = "Rational", snippetType="autosnippet" },
        t("\\Q")
    ),
    
    s({ trig = "ZZ", dscr = "Pos-int", snippetType="autosnippet" },
        t("\\Z")
    ),
    

}
