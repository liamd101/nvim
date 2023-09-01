require("liamd.remap")
require("liamd.set")


require("luasnip").config.set_config({
    enable_autosnippets = true,

    store_selection_keys = "<Tab>",
})

require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})
