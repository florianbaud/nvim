require("nvchad.configs.lspconfig").defaults()

-- local servers = { "html", "cssls", "ty" }
--
-- vim.lsp.enable(servers)
--
-- vim.lsp.config("ty", {
--   settings = {
--     ty = {
--       -- ty language server settings go here
--     },
--   },
-- })
--

local servers = { html = {}, cssls = {}, ty = {} }

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end

-- read :h vim.lsp.config for changing options of lsp servers
