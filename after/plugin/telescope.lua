if vim.g.vscode then return end
local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require("telescope.actions")
local multi_rg = require("user.multi-rg")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "TelescopeResults",
	callback = function(ctx)
		vim.api.nvim_buf_call(ctx.buf, function()
			vim.fn.matchadd("TelescopeParent", "\t\t.*$")
			vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
		end)
	end,
})

local function filenameFirst(_, path)
	local tail = vim.fs.basename(path)
	local parent = vim.fs.dirname(path)
	if parent == "." then return tail end
	return string.format("%s\t\t%s", tail, parent)
end

-- require("telescope").setup {
-- 	pickers = {
-- 		find_files = {
-- 			path_display = filenameFirst,
-- 		}
-- 	}
-- }
vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files({
    find_command = {
      'rg',
      '--files',
      '--glob=*.{js,ts,jsx,tsx}',
      '--glob=!*stories*',
    }
  })
end)
vim.keymap.set('n', '<leader>fa', builtin.find_files, {})
vim.keymap.set('n', '<leader>ft', function ()
 builtin.live_grep({ glob_pattern = { "!*generated*", "!*schema.json" } })
end)
vim.keymap.set('n', '<leader>fg', multi_rg, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")})
end)
vim.keymap.set('n', '<leader>fw', function()
	builtin.grep_string({ word_match ='-w' })
end)
local action_state = require("telescope.actions.state")
local action_utils = require("telescope.actions.utils")
local function multi_select(prompt_bufnr)
  local current_picker = action_state.get_current_picker(prompt_bufnr)
  local has_multi_selection = (
    next(current_picker:get_multi_selection()) ~= nil
  )

  if has_multi_selection then
    local results = {}
    action_utils.map_selections(prompt_bufnr, function(selection)
      table.insert(results, selection[1])
    end)

    -- load the selections into buffers list without switching to them
    for _, filepath in ipairs(results) do
      -- not the same as vim.fn.bufadd!
      vim.cmd.badd({ args = { filepath } })
    end


    require("telescope.pickers").on_close_prompt(prompt_bufnr)

    -- switch to newly loaded buffers if on an empty buffer
    if vim.fn.bufname() == "" and not vim.bo.modified then
      vim.cmd.bwipeout()
      vim.cmd.buffer(results[1])
    end
    return
  end

  -- if does not have multi selection, open single file
  require("telescope.actions").file_edit(prompt_bufnr)
end
telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },

    mappings = {
      i = {
        ["<Down>"] = actions.cycle_history_next,
        ["<Up>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<CR>"] = multi_select,
      },
      n = {
        ["<leader>qf"] = actions.smart_send_to_qflist + actions.open_qflist,
        --   ["<leader>sr"] = multi_find_and_replace,
      },
    },
  },
	pickers = {
		find_files = {
			path_display = filenameFirst,
		},
	},
}
