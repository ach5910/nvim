local alpha = require("alpha")

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
  dashboard.button("f", " " .. " Find file", ":lua require('telescope.builtin').find_files({ find_command = { 'rg', '--files', '--glob=*.{js,ts,jsx,tsx}', '--glob=!*stories*', } }) <CR>"),
  dashboard.button("a", " " .. " Find (all) file", ":Telescope find_files <CR>"),
  dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
  dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", " " .. " Find text", ":lua require('telescope.builtin').live_grep({  glob_pattern = { '!*generated*', '!*schema.json' } }) <CR>"),
  dashboard.button("g", " " .. " Multi grep", ":lua require('user.multi-rg')() <CR>"),
  dashboard.button("c", " " .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
  dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}

local function footer()
  local footers = {
    "You're an imposter",
    "An editor for an idiot",
    "Vim: Take twice as long with half the keystrokes",
    "I forgot how to go up and down...jk",
    "Whooaaa look at you using Vim, you must be super edgy",
  }
  return footers[math.random(#footers)]
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
