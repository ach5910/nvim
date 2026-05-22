vim.g.mapleader = " "
local opts = { silent = true }

vim.keymap.set("n", "<leader>cp", function()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("+", path)
  print("Copied relative path: " .. path)
end, { desc = "Copy relative file path to clipboard" })

if vim.g.vscode then
  -- Find word under cursor
  vim.keymap.set("n", "<leader>fw", "<Cmd>lua require('vscode').action('workbench.action.findInFiles', { args = { query = vim.fn.expand('<cword>') } })<CR>", opts)
  -- Find text
  vim.keymap.set("n", "<leader>ft", "<Cmd>lua require('vscode').action('workbench.action.findInFiles')<CR>", opts)
  -- Find files
  vim.keymap.set("n", "<leader>ff", "<Cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>", opts)
  vim.keymap.set("n", "<leader>lr", "<Cmd>lua require('vscode').action('editor.action.rename')<CR>", opts)
  vim.keymap.set("n", "<leader>gr", "<Cmd>lua require('vscode').action('editor.action.goToReferences')<CR>", opts)
  -- Tab navigation
  vim.keymap.set("n", "<S-h>", "<Cmd>lua require('vscode').action('workbench.action.previousEditor')<CR>", opts)
  vim.keymap.set("n", "<S-l>", "<Cmd>lua require('vscode').action('workbench.action.nextEditor')<CR>", opts)
  -- Better window navigation
  vim.keymap.set("n", "<C-h>", "<Cmd>lua require('vscode').action('workbench.action.moveActiveEditorGroupLeft')<CR>", opts)
  vim.keymap.set("n", "<C-j>", "<Cmd>lua require('vscode').action('workbench.action.moveActiveEditorGroupDown')<CR>", opts)
  vim.keymap.set("n", "<C-k>", "<Cmd>lua require('vscode').action('workbench.action.moveActiveEditorGroupUp')<CR>", opts)
  vim.keymap.set("n", "<C-l>", "<Cmd>lua require('vscode').action('workbench.action.moveActiveEditorGroupRight')<CR>", opts)

  -- Open file explorer
  vim.keymap.set("n", "<leader>n", "<Cmd>lua require('vscode').action('workbench.view.explorer')<CR>", opts)
  -- Open side bar
  vim.keymap.set("n", "<leader>b", "<Cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<CR>", opts)
  -- vim.keymap.set("n", "]d", "<Cmd>lua require('vscode').action('editor.action.marker.nextInFiles')<CR>", opts)
  -- vim.keymap.set("n", "[d", "<Cmd>lua require('vscode').action('editor.action.marker.prevInFiles')<CR>", opts)
  vim.keymap.set("n", "]d", "<Cmd>lua require('vscode').action('editor.action.marker.next')<CR>", opts)
  vim.keymap.set("n", "[d", "<Cmd>lua require('vscode').action('editor.action.marker.prev')<CR>", opts)

  vim.keymap.set("n", "<S-q>", "<Cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>", opts)

  -- Go to last file
  vim.keymap.set("n", "<C-6>", "<Cmd>call VSCodeNotify('workbench.action.openNextRecentlyUsedEditor')<CR>", opts)

  -- Pin and unpin file tabs
  vim.keymap.set("n", "<leader>aa", "<Cmd>lua require('vscode').action('workbench.action.pinEditor')<CR>", opts)
  vim.keymap.set("n", "<leader>dd", "<Cmd>lua require('vscode').action('workbench.action.unpinEditor')<CR>", opts)

  -- Move editor left/right
  vim.keymap.set("n", "<leader>h", "<Cmd>lua require('vscode').action('workbench.action.moveActiveLeftInGroup')<CR>", opts)
  vim.keymap.set("n", "<leader>l", "<Cmd>lua require('vscode').action('workbench.action.moveActiveRightInGroup)<CR>", opts)

  -- Jump to file tabs 1-9
  vim.keymap.set("n", "<leader>1", "<Cmd>lua require('vscode').action('workbench.action.openEditorAtIndex1')<CR>", opts)
  vim.keymap.set("n", "<leader>2", "<Cmd>lua require('vscode').action('workbench.action.openEditorAtIndex2')<CR>", opts)
  vim.keymap.set("n", "<leader>3", "<Cmd>lua require('vscode').action('workbench.action.openEditorAtIndex3')<CR>", opts)
  vim.keymap.set("n", "<leader>4", "<Cmd>lua require('vscode').action('workbench.action.openEditorAtIndex4')<CR>", opts)
  vim.keymap.set("n", "<leader>5", "<Cmd>lua require('vscode').action('workbench.action.openEditorAtIndex5')<CR>", opts)
  vim.keymap.set("n", "<leader>6", "<Cmd>lua require('vscode').action('workbench.action.openEditorAtIndex6')<CR>", opts)
  vim.keymap.set("n", "<leader>7", "<Cmd>lua require('vscode').action('workbench.action.openEditorAtIndex7')<CR>", opts)
  vim.keymap.set("n", "<leader>8", "<Cmd>lua require('vscode').action('workbench.action.openEditorAtIndex8')<CR>", opts)
  vim.keymap.set("n", "<leader>9", "<Cmd>lua require('vscode').action('workbench.action.openEditorAtIndex9')<CR>", opts)
  -- vim.keymap.set('n', '<C-u>', '<C-u>M', opts)
  -- vim.keymap.set('n', '<C-d>', '<C-d>M', opts)
  -- Wrap text abbrev emmet
  -- vim.keymap.set("v", "<leader>w", "<Cmd>lua require('vscode').action('editor.emmet.action.wrapWithAbbreviation')<CR>", opts)

-- {
--     "key": "space a",
--     "command": "workbench.action.pinEditor",
--     "when": "!activeEditorIsPinned && editorTextFocus && neovim.mode == 'normal'"
--   },
--   {
--     "key": "space a",
--     "command": "workbench.action.unpinEditor",
--     "when": "activeEditorIsPinned && editorTextFocus && neovim.mode == 'normal'"
--   },
--   {
--     "key": "space 1",
--     "command": "workbench.action.openEditorAtIndex1",
--     "when": "editorTextFocus && neovim.mode == 'normal'"
--   },
--   {
--     "key": "space 2",
--     "command": "workbench.action.openEditorAtIndex2",
--     "when": "editorTextFocus && neovim.mode == 'normal'"
--   },
--   {
--     "key": "space 3",
--     "command": "workbench.action.openEditorAtIndex3",
--     "when": "editorTextFocus && neovim.mode == 'normal'"
--   },
--   {
--     "key": "space 4",
--     "command": "workbench.action.openEditorAtIndex4",
--     "when": "editorTextFocus && neovim.mode == 'normal'"
--   },
--   {
--     "key": "space 5",
--     "command": "workbench.action.openEditorAtIndex5",
--     "when": "editorTextFocus && neovim.mode == 'normal'"
--   },
--   {
--     "key": "space 6",
--     "command": "workbench.action.openEditorAtIndex6",
--     "when": "editorTextFocus && neovim.mode == 'normal'"
--   },
--   {
--     "key": "space 7",
--     "command": "workbench.action.openEditorAtIndex7",
--     "when": "editorTextFocus && neovim.mode == 'normal'"
--   },
--   {
--     "key": "space 8",
--     "command": "workbench.action.openEditorAtIndex8",
--     "when": "editorTextFocus && neovim.mode == 'normal'"
--   },
--   {
--     "key": "space 9",
--     "command": "workbench.action.openEditorAtIndex9",
--     "when": "editorTextFocus && neovim.mode == 'normal'"
--   },
--   {
--     "key": "space h",
--     "command": "workbench.action.moveEditorLeftInGroup",
--     "when": "editorTextFocus && neovim.mode == 'normal'"
--   },
--   {
--     "key": "space l",
--     "command": "workbench.action.moveEditorRightInGroup",
--     "when": "editorTextFocus && neovim.mode == 'normal'"
--   }

else
  -- Neovim only
  local auto_remove = require("user.auto-remove")

  -- Add toggle keymap for auto-remove
  vim.keymap.set("n", "<leader>ta", function()
    auto_remove.toggle()
  end, { silent = true, desc = "Toggle auto-remove functionality" })

  -- Better window navigation
  -- vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
  -- vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
  -- vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
  -- vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

  -- Navigate buffers
  vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
  vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
  -- NvimTree
  vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", opts)

  -- Close all buffers and reset auto_remove saved_buffers
  vim.keymap.set("n", "<leader>db", function()
    auto_remove.reset_saved_buffers()
    vim.cmd("bufdo Bdelete!")
  end, opts)
  -- Markdown Preview --
  vim.keymap.set("n", "<leader>md", ":RenderMarkdown toggle<CR>", { silent = true })
  -- Close buffers
  vim.keymap.set("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)
end

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>rn", ":set invrelativenumber<CR>", opts)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

--  reselect pasted text
vim.keymap.set("n", "gp", "`[v`]", opts)


-- Clear highlights
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Delete without yanking
vim.keymap.set("n", "<leader>d", '"_d', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>d", '"_d', { noremap = true, silent = true })

-- Better paste
vim.keymap.set("v", "<leader>p", '"_dP', opts)

-- Move text up and down
vim.keymap.set("n", "∆", "<Esc>:m .+1<CR>==", opts)
vim.keymap.set("n", "˚", "<Esc>:m .-2<CR>==", opts)

-- Center screen after jumping
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
-- vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)

-- Insert --
-- Press jk fast to enter
-- vim.keymap.set("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv=gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv=gv", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv=gv", opts)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv=gv", opts)

-- Research and replace current word --
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
-- Plugins --
vim.keymap.set("n", "<leader>do", ":DiffviewOpen<CR>", { silent = true })
vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>", { silent = true })
vim.keymap.set("n", "<leader>df", ":DiffviewFileHistory %<CR>", { silent = true })

-- Surround arround
vim.keymap.set("n", "<leader>w", "ysiw", { remap = true })
vim.keymap.set("n", "<leader>W", "ysiW", { remap = true })
vim.keymap.set("n", "<leader>}", "ysa}", { remap = true })
vim.keymap.set("n", "<leader>{", "ysa{", { remap = true })
vim.keymap.set("n", "<leader>)", "ysa)", { remap = true })
vim.keymap.set("n", "<leader>(", "ysa(", { remap = true })
vim.keymap.set("n", "<leader>[", "ysa[", { remap = true })
vim.keymap.set("n", "<leader>]", "ysa]", { remap = true })
vim.keymap.set("n", "<leader>'", "ysa'", { remap = true })
vim.keymap.set("n", '<leader>"', 'ysa"', { remap = true })
vim.keymap.set("n", '<leader>`', 'ysa`', { remap = true })
vim.keymap.set("n", '<leader>t', 'ySSt', { remap = true })

-- paste from clipboard

vim.keymap.set("n", "<leader>pp", '"+p', { silent = true })
vim.keymap.set("n", "<leader>PP", '"+P', { silent = true })

-- Claude code
function Copy_selection_for_claude()
  local file = vim.fn.expand("%:.")
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local lines = vim.fn.getline(start_line, end_line) --[[@as string[] ]]
  local code = table.concat(lines, "\n")
  local ext = vim.fn.expand("%:e")

  local message = table.concat({
    string.format("@%s:%d-%d", file, start_line, end_line),
    "",
    "```" .. ext,
    code,
    "```",
  }, "\n")

  vim.fn.setreg("+", message)
  print(string.format("Copied @%s:%d-%d for Claude Code", file, start_line, end_line))
end

vim.keymap.set("v", "<leader>cy", ":<C-u>lua Copy_selection_for_claude()<CR>", {
  desc = "Copy selection for Claude",
})

local function send_to_claude_pane(text)
  local pane = vim.fn.system("tpipe cc pane"):gsub("%s+$", "")
  if vim.v.shell_error ~= 0 or pane == "" then
    print("No Claude Code pane found in this window")
    return false
  end
  vim.fn.system({ "tmux", "load-buffer", "-" }, text)
  vim.fn.system({ "tmux", "paste-buffer", "-t", pane, "-p" })
  return true
end

local function format_selection_for_claude()
  local file = vim.fn.expand("%:.")
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local lines = vim.fn.getline(start_line, end_line) --[[@as string[] ]]
  local code = table.concat(lines, "\n")
  local ext = vim.fn.expand("%:e")

  return table.concat({
    "",
    string.format("@%s:%d-%d", file, start_line, end_line),
    "",
    "```" .. ext,
    code,
    "```",
  }, "\n")
end

function Send_selection_to_claude()
  local message = format_selection_for_claude()
  if send_to_claude_pane(message) then
    local file = vim.fn.expand("%:.")
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    print(string.format("Sent @%s:%d-%d to Claude Code", file, start_line, end_line))
  end
end

function Send_selection_to_claude_with_input()
  local input = vim.fn.input("Message: ")
  if input == "" then
    print("Cancelled")
    return
  end
  local selection = format_selection_for_claude()
  local message = "\n" .. input .. "\n" .. selection
  if send_to_claude_pane(message) then
    local file = vim.fn.expand("%:.")
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    print(string.format("Sent @%s:%d-%d to Claude Code", file, start_line, end_line))
  end
end

vim.keymap.set("v", "<leader>cp", ":<C-u>lua Send_selection_to_claude()<CR>", {
  desc = "Send selection to Claude Code pane",
})

vim.keymap.set("v", "<leader>ci", ":<C-u>lua Send_selection_to_claude_with_input()<CR>", {
  desc = "Send selection to Claude Code pane with message",
})
-- Telescope
-- vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", opts)
-- vim.keymap.set("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
-- vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>", opts)
-- vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", opts)
-- vim.keymap.set("n", "<leader>fg", ":Telescope git_status<CR>", opts)
-- vim.keymap.set('n', '<leader>fw', ":Telescope grep_string<CR>", { word_match ='-w' })
-- vim.keymap.set('n', '<leader>fw', function()
--   require('telescope.builtin').grep_string({ word_match ='-w' })
-- end)
-- vim.keymap.set('n', '<leader>fw', function()
-- 	require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })
-- end)

-- Git
-- vim.keymap.set("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
-- vim.keymap.set("n", "<leader>/", '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', opts)
-- vim.keymap.set("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
-- vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
-- vim.keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- vim.keymap.set("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
-- vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- vim.keymap.set("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- vim.keymap.set("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
