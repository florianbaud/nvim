vim.pack.add {
  "https://github.com/bluz71/vim-moonfly-colors",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/rafamadriz/friendly-snippets",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/rebelot/kanagawa.nvim",
}

--- mini icons ---
MiniIcons = require "mini.icons"
MiniIcons.setup()
MiniIcons.tweak_lsp_kind()

--- mini files ---
local MiniFiles = require "mini.files"
MiniFiles.setup {
  mappings = {
    go_in = "<CR>",
    go_in_plus = "L",
    go_out = "_",
    go_out_plus = "H",
  },
}

vim.keymap.set("n", "-", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" })
vim.keymap.set("n", "<leader>-", function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
  MiniFiles.reveal_cwd()
end, { desc = "Toggle into currently opened file" })

--- mini notify ---
require("mini.notify").setup {
  -- only show messages
  content = {
    format = function(notif)
      return notif.msg
    end,
  },
  lsp_progress = {
    -- Whether to enable showing
    enable = true,

    -- Notification level
    level = "DEBUG",

    -- Duration (in ms) of how long last message should be shown
    duration_last = 1000,
  },
}

--- mini cmdline completion ---
require("mini.cmdline").setup {
  autocorrect = { enable = false },
}

--- mini surround ---
require("mini.surround").setup()
-- Default Keymaps
-- | `sa` | Add surrounding or Direct with 'saiw' |
-- | `sd` | Delete surrounding |
-- | `sr` | Replace surrounding |
-- | `sf` | Find surrounding (right) |
-- | `sF` | Find surrounding (left) |
-- | `sh` | Highlight surrounding |
-- | `sn` | Update n_lines |
-- | `l` / `n` | as suffix for prev/next |

--- mini picker ---
local MiniPick = require "mini.pick"
MiniPick.setup()

vim.keymap.set("n", "<leader>pf", function()
  MiniPick.builtin.files()
end, { desc = "Mini File Picker" })
vim.keymap.set("n", "<leader>ps", function()
  MiniPick.builtin.grep { pattern = vim.fn.expand "<cword>" }
end, { desc = "Grep word/Search word" })
vim.keymap.set("n", "<leader>vh", function()
  MiniPick.builtin.help()
end, { desc = "Mini Help" })

--- mini extra ---
local MiniExtra = require "mini.extra"
MiniExtra.setup()

vim.keymap.set("n", "<leader>xx", function()
  MiniExtra.pickers.diagnostic()
end, { desc = "Mini Picker Diagnostics" })
vim.keymap.set("n", "<leader>pk", function()
  MiniExtra.pickers.keymaps()
end, { desc = "Search keymaps" })

--- mini completions ---
require("mini.completion").setup {
  window = {
    info = { height = 25, width = 80, border = nil },
    signature = { height = 25, width = 80, border = nil },
  },
  lsp_completion = {
    auto_setup = true,
    source_func = "omnifunc",
  },
}

vim.keymap.set("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
vim.keymap.set("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

--- mini snippets ---
local MiniSnippets = require "mini.snippets"
MiniSnippets.setup {
  snippets = {
    MiniSnippets.gen_loader.from_lang(), -- loads friendly-snippets
  },
}
MiniSnippets.start_lsp_server()

--- mini diff and fugitive ---
local MiniDiff = require "mini.diff"
MiniDiff.setup {
  source = MiniDiff.gen_source.git { index = false },
  view = { signs = { add = "▒", change = "▒", delete = "▒" } },
}

vim.keymap.set("n", "<leader>gg", "<cmd>tabnew | Git | only<cr>", { desc = "Fugitive Full Page New Tab" })
vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>", { desc = "Git diff split" })

--- mini tabline ---
require("mini.tabline").setup()

--- mini statusline ---
local MiniStatusline = require "mini.statusline"
MiniStatusline.setup {
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
      local git = MiniStatusline.section_git { trunc_width = 40 }
      local diff = MiniStatusline.section_diff { trunc_width = 75 }
      local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
      local lsp = MiniStatusline.section_lsp { trunc_width = 75 }
      local filename = MiniStatusline.section_filename { trunc_width = 140 }
      local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
      local location = MiniStatusline.section_location { trunc_width = 75 }
      local search = MiniStatusline.section_searchcount { trunc_width = 75 }

      return MiniStatusline.combine_groups {
        { hl = mode_hl, strings = { mode } },
        { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
        "%<", -- Mark general truncate point
        { hl = "MiniStatuslineFilename", strings = { filename } },
        "%=", -- End left alignment
        { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
        { hl = mode_hl, strings = { search, location } },
      }
    end,
  },
}

--- mini comment ---
require("mini.comment").setup()
