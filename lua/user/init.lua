require("user.keymaps")
require("user.options")
if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
  local auto_remove = require("user.auto-remove")
  local luasnip = require('luasnip')
  vim.api.nvim_create_autocmd("ModeChanged", {
    group = vim.api.nvim_create_augroup("UnlinkLuaSnipSnippetOnModeChange", {
      clear = true,
    }),
    pattern = { "s:n", "i:*" },
    desc = "Forget the current snippet when leaving the insert mode",
    callback = function(evt)
      -- If we have n active nodes, n - 1 will still remain after a `unlink_current()` call.
      -- We unlink all of them by wrapping the calls in a loop.
      while true do
        if luasnip.session and luasnip.session.current_nodes[evt.buf] and not luasnip.session.jump_active then
          luasnip.unlink_current()
        else
          break
        end
      end
    end,
  })

  -- Define an auto command that triggers when a buffer is written (saved)
  vim.api.nvim_create_autocmd("BufWritePost", {
    callback = function(args)
      local bufnr = args.buf
      if auto_remove.is_file_buffer(bufnr) then
        -- Mark the buffer as saved
        auto_remove.mark_buffer_saved(bufnr)
      end
    end,
  })

  -- Define an auto command that triggers when a buffer is hidden
  vim.api.nvim_create_autocmd("BufLeave", {
    callback = function(args)
      local bufnr = args.buf
      -- Check if the buffer is modified or has not been saved during this session
      if auto_remove.is_file_buffer(bufnr) and not vim.api.nvim_buf_get_option(bufnr, "modified") and not auto_remove.is_buffer_saved(bufnr) then
        vim.schedule(function ()
          if vim.api.nvim_buf_is_loaded(bufnr) and not auto_remove.is_buffer_visible(bufnr) then
            -- Call Bdelete if the buffer is not modified and hasn't been saved
            vim.cmd('Bdelete! ' .. bufnr)
          end
        end)
      end
    end,
  })

  -- Create a namespace
  local ns_id = vim.api.nvim_create_namespace("relative_line_numbers")

  vim.api.nvim_create_autocmd("CursorMoved", {
    pattern = { "*.lua", "lua", "*.js", "*.ts", "*.jsx", "*.tsx", "*.graphql", "*.yaml", "*.json", "*.txt", "*.md" },
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      local current_line = vim.fn.line('.')
      local line_count = vim.api.nvim_buf_line_count(bufnr)

      -- Clear existing virtual text using the correct namespace
      vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)

      for i = 1, line_count do
        if i ~= current_line then
          local rel_num = math.abs(current_line - i)
          local text = tostring(rel_num)
          vim.api.nvim_buf_set_extmark(bufnr, ns_id, i-1, -1, {
            virt_text = {{text, 'LineNr'}},
            virt_text_pos = 'eol',
            hl_mode = 'combine',
            -- hl_mode = 'combine', 'blend', 'replace'
          })
          local line_content = vim.fn.getline(i)
          local spaces = vim.fn.indent(i)
          -- Find the position of the first non-whitespace character that isn't '▏'
          local first_non_whitespace_not_indent_char = line_content:find("[^%s▏]")

          if first_non_whitespace_not_indent_char and (spaces >= 8 or line_content:match("^%s*%s%s%s%s%s%s%s%s%s%s%s")) then
            vim.api.nvim_buf_set_extmark(bufnr, ns_id, i-1, first_non_whitespace_not_indent_char - #text - 2, {
              virt_text = {{text, 'LineNr'}},
              virt_text_pos = 'overlay',  -- Change to 'eol' if you want to place it after the line content
              hl_mode = "combine",
            })
          end
        end
      end
    end,
  })

  -- vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")
  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    callback = function()
      vim.cmd [[
      if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
      ]]
    end,
  })

end -- End of neovim only code

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
	callback = function()
		vim.cmd([[

      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit"},
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})


vim.api.nvim_create_autocmd({ "BufRead", "BufNew" }, {
  pattern = { "*.jbuilder"},
  callback = function ()
    vim.cmd("set filetype=ruby")
  end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
	callback = function()
		vim.cmd("quit")
	end,
})


-- toggle off to enable auto block comment insert for new lines
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.tsx', '*.ts', '*.jsx', '*.js' },
  command = 'silent! EslintFixAll',
  -- group = vim.api.nvim_create_augroup('MyAutocmdsJavaScripFormatting', {}),
})
vim.g.skip_ts_context_commentstring_module = true
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	pattern = { "*.java" },
-- 	callback = function()
-- 		vim.lsp.codelens.refresh()
-- 	end,
-- })

-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
-- 	callback = function()
-- 		vim.cmd("hi link illuminatedWord LspReferenceText")
-- 	end,
-- })

-- Use 'q' to quit from common plugins
--[[ vim.api.nvim_create_autocmd({ "FileType" }, { ]]
--[[   pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" }, ]]
--[[   callback = function() ]]
--[[     vim.cmd [[ ]]
--[[       nnoremap <silent> <buffer> q :close<CR>  ]]
--[[       set nobuflisted  ]]
--[[     ]] --]]
--[[   end, ]]
--[[ }) ]]
--[[]]
--[[ -- Remove statusline and tabline when in Alpha ]]
--[[ vim.api.nvim_create_autocmd({ "User" }, { ]]
--[[   pattern = { "AlphaReady" }, ]]
--[[   callback = function() ]]
--[[     vim.cmd [[ ]]
--[[       set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2 ]]
--[[       set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3 ]]
--[[     ]] --]]
--[[   end, ]]
--[[ }) ]]
--[[]]
--[[ -- Set wrap and spell in markdown and gitcommit ]]
--[[ vim.api.nvim_create_autocmd({ "FileType" }, { ]]
--[[   pattern = { "gitcommit", "markdown" }, ]]
--[[   callback = function() ]]
--[[     vim.opt_local.wrap = true ]]
--[[     vim.opt_local.spell = true ]]
--[[   end, ]]
--[[ }) ]]
--[[]]
--[[ vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif" ]]
--[[]]
--[[ -- Fixes Autocomment ]]
--[[ vim.api.nvim_create_autocmd({ "BufWinEnter" }, { ]]
--[[   callback = function() ]]
--[[     vim.cmd "set formatoptions-=cro" ]]
--[[   end, ]]
--[[ }) ]]
--[[]]
--[[ -- Highlight Yanked Text ]]
--[[ vim.api.nvim_create_autocmd({ "TextYankPost" }, { ]]
--[[   callback = function() ]]
--[[     vim.highlight.on_yank { higroup = "Visual", timeout = 200 } ]]
--[[   end, ]]
--[[ }) ]]

