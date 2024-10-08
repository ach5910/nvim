if vim.g.vscode then return end
local ibl = require("ibl")

-- show_trailing_blankline_indent = false,
-- show_first_indent_level = true,
-- use_treesitter = true,
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

ibl.setup {
  whitespace = {
    remove_blankline_trail = true,
  },
  exclude = {
    -- buftypes = { "terminal", "nofile" },
    filetypes = {
      "help",
      "packer",
      "NvimTree",
    },
  },
  indent = {
    char = "▏",
    highlight = highlight,
  },
  scope = {
    enabled = true,
  }
}
