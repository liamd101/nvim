local ts_utils = require("nvim-treesitter.ts_utils")

local M = {}

function M.in_mathzone()
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

return M
