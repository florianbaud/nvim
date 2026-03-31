require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyrefly" }

-- vim.lsp.config("ruff", {
--   init_options = {
--     settings = {
--       args = {},
--     },
--   },
-- })

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
