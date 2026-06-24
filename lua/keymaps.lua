vim.g.mapleader = " "

-- The initial keymap was from vim (:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>") source: https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
vim.keymap.set("i", "<CR>", function()
  return vim.fn.pumvisible() == 1 and "\25" or "\7u<CR>"
end, { expr = true })

vim.keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlighting", silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })

vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word cursor is on globally" }
)
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart config :restart)" })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Quit terminal mode" })

vim.keymap.set("n", "<Tab>", "]b", { desc = "Switch tab right", remap = true })
vim.keymap.set("n", "<S-Tab>", "[b", { desc = "Switch tab left", remap = true })

vim.keymap.set("n", "<M-h>", "<cmd>hor te<CR><cmd>res 15<CR>i")
vim.keymap.set("n", "<M-v>", "<cmd>vert te<CR>i")

-- native undotree
vim.keymap.set("n", "<leader>u", function()
  vim.cmd.packadd "nvim.undotree"
  require("undotree").open()
end, { desc = "Toggle Builtin Undotree" })
