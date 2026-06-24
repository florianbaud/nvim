-- 1. Tell Neovim what to save in the session file
-- 'buffers' saves open files, 'curdir' saves the path, 'folds' saves code folds
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "folds" }

-- Create a standardized path for session files
local session_dir = vim.fn.stdpath "data" .. "/sessions/"
vim.fn.mkdir(session_dir, "p") -- Ensure the directory exists

-- Get a unique safe file name for the session based on the current working directory
local function get_session_file()
  local cwd = vim.fn.getcwd():gsub("/", "%%"):gsub("\\", "%%"):gsub(":", "%%")
  return session_dir .. cwd .. ".vim"
end

-- 2. Automatically save the session when exiting Neovim
vim.api.nvim_create_autocmd("VimLeavePre", {
  desc = "Save session on exit",
  callback = function()
    -- Don't save a session if we are in an empty/anonymous buffer or specific filetypes
    if vim.bo.filetype ~= "gitcommit" and vim.bo.filetype ~= "alpha" then
      vim.cmd("mksession! " .. vim.fn.fnameescape(get_session_file()))
    end
  end,
})

-- 3. Automatically load the session when starting Neovim in a directory
vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Restore session on startup",
  nested = true,
  callback = function()
    -- Only restore if Neovim was opened without specific file arguments
    if vim.fn.argc() == 0 then
      local session_file = get_session_file()
      if vim.fn.filereadable(session_file) == 1 then
        vim.cmd("source " .. vim.fn.fnameescape(session_file))
      end
    end
  end,
})
