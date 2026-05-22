require('nvim-surround').setup({
  aliases = {
    ["b"] = "b"
  },
  surrounds = {
    ["b"] = {
      add = function()
        local config = require("nvim-surround.config")
        local result = config.get_input("Enter the block prefix: ")
        if result then
          return { { result .. "{" }, { "}" } }
        end
      end,
      find = function()
        local config = require("nvim-surround.config")
        print("find block again")
        local selection = config.get_selection({
          query = {
            capture = "@block.outer",
            type = "textobjects",
          },
        })
        print(vim.inspect(selection))
        return
      end,
      delete = "^(.-{)().-(})()$",
      change = {
        target = "^(.-{)().-(})()$",
        replacement = function()
          local config = require("nvim-surround.config")
          local result = config.get_input("Enter the block prefix: ")
          if result then
            return { { result .. "{" }, { "}" } }
          end
        end,
      },
    },
  }
})
