if vim.g.vscode then return end
require('render-markdown').setup({
  file_types = { 'markdown', "Avante" },
  heading = {
    background = {
      'RenderMarkdownH1Bg',
      'RenderMarkdownH2Bg',
      'RenderMarkdownH3Bg',
      'RenderMarkdownH4Bg',
      'RenderMarkdownH5Bg',
      'RenderMarkdownH6Bg',
    },
  }
})
