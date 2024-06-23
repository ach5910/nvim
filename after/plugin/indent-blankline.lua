local ibl = require("ibl")

-- show_trailing_blankline_indent = false,
-- show_first_indent_level = true,
-- use_treesitter = true,
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
  },
  scope = {
    enabled = true,
  }
}
