if vim.g.vscode then return end
require("copilot").setup({
  panel = {
    auto_refresh = false,
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = false,
    },
  }
})
