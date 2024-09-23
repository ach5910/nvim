local dump = require('user.dump')
-- Table to keep track of saved buffers
local saved_buffers = {}

local M = {}

-- Function to mark a buffer as saved
M.mark_buffer_saved =  function(bufnr)
    saved_buffers[bufnr] = true
end

-- Function to check if a buffer is saved
M.is_buffer_saved = function(bufnr)
    return saved_buffers[bufnr] == true
end
-- Function to check if a buffer is a regular file
M.is_file_buffer = function(bufnr)
    local buftype = vim.api.nvim_buf_get_option(bufnr, "buftype")
    return buftype == "" -- Empty buftype indicates a regular file buffer
end
-- Function to reset the saved buffers table
M.reset_saved_buffers = function()
    saved_buffers = {}
end
-- Function to check if a buffer is still visible in any window
M.is_buffer_visible = function(bufnr)
    for _, winid in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_buf(winid) == bufnr then
            return true
        end
    end
    return false
end

M.list_buffers = function()
  local bufnrs = vim.tbl_filter(function(bufnr)
    if 1 ~= vim.fn.buflisted(bufnr) then
      return false
      end
    return true
  end, vim.api.nvim_list_bufs())
  print(dump(bufnrs))
end
return M
