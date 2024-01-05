local ls = require("luasnip")

ls.config.set_config({
  enable_autosnippets = true,
})

vim.keymap.set('i', '<C-k>', function() if ls.expand_or_jumpable() then ls.expand_or_jump() end end)

require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})

