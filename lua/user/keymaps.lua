vim.g.mapleader = " "
local opts = { silent = true }

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
  vim.keymap.set("n", "<C-6>", "<Cmd>lua require('vscode').action('workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup')<CR>", opts)

else
  -- Neovim only
  local auto_remove = require("user.auto-remove")

  -- Better window navigation
  vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
  vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
  vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
  vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

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


-- Better paste
vim.keymap.set("v", "p", '"_dP', opts)

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
