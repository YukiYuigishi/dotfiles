--- init.lua
vim.loader.enable()
require("core.base")
require("core.lazy")
-- require("core.options")
require("core.keymaps")
-- require("core.autocmds")
require("core.colorscheme")
require("core.hilights")

print("init.lua loaded")
