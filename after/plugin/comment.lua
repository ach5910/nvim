-- vim.g.skip_ts_context_commentstring_module = true
require('ts_context_commentstring').setup {
  languages = {
    javascript = {
      __default = '// %s',
      jsx_element = '{/* %s */}',
      jsx_fragment = '{/* %s */}',
      jsx_attribute = '// %s',
      comment = '// %s',
      __multiline = '/* %s */'
    },
    typescript = {
      __default = '// %s',
      jsx_element = '{/* %s */}',
      jsx_fragment = '{/* %s */}',
      jsx_attribute = '// %s',
      comment = '// %s',
      __multiline = '/* %s */'
    },
    typescriptreact = {
      __default = '// %s',
      jsx_element = '{/* %s */}',
      jsx_fragment = '{/* %s */}',
      jsx_attribute = '// %s',
      comment = '// %s',
      __multiline = '/* %s */'
    },
    javascriptreact = {
      __default = '// %s',
      jsx_element = '{/* %s */}',
      jsx_fragment = '{/* %s */}',
      jsx_attribute = '// %s',
      comment = '// %s',
      __multiline = '/* %s */'
    },
  },
}
-- vim.g.skip_ts_context_commentstring_module = true

require('Comment').setup {
  -- pre_hook = function()
  --   return vim.bo.commentstring
  -- end,
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}
