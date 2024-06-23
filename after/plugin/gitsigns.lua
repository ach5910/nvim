local gitsigns = require("gitsigns")

gitsigns.setup{
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
  numhl = true,
  linehl = true,
  on_attach = function (bufnr)
      
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "<leader>gb", gitsigns.toggle_current_line_blame, opts)
    vim.keymap.set("n", "<leader>gl", gitsigns.toggle_linehl, opts)
    vim.keymap.set("n", "<leader>gn", gitsigns.toggle_numhl, opts)
    vim.keymap.set("n", "<leader>gg", function ()
      gitsigns.toggle_numhl()
      gitsigns.toggle_linehl()
    end, opts)
  end
}
