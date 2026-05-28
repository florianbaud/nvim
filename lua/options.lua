require "nvchad.options"

-- add yours here!
-- vim.g.clipboard = "osc52"
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy "+",
    ["*"] = require("vim.ui.clipboard.osc52").copy "*",
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste "+",
    ["*"] = require("vim.ui.clipboard.osc52").paste "*",
  },
}

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- vimtex configuration
-- vim.g.vimtex_compiler_method = 'latexrun'

