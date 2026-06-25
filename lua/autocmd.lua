vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Automatically enter terminal mode when openning the terminal",
  pattern = "*",
  command = "startinsert",
})
