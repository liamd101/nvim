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

local ts_utils = require("nvim-treesitter.ts_utils")

local function in_mathzone()
    local node = ts_utils.get_node_at_cursor()
    if not node then return false end

    while node do
        if node:type() == "inline_math" or node:type() == "block_math" then
            return true
        end
        node = node:parent()
    end

    return false
end

return {
    s({ trig = "cc", dscr = "Subset", snippetType = "autosnippet" },
        t("\\subseteq"),
        { condition = in_mathzone }
    ),
}
