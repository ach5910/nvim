-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/aaronhunt/.cache/nvim/packer_hererocks/2.1.1713484068/share/lua/5.1/?.lua;/Users/aaronhunt/.cache/nvim/packer_hererocks/2.1.1713484068/share/lua/5.1/?/init.lua;/Users/aaronhunt/.cache/nvim/packer_hererocks/2.1.1713484068/lib/luarocks/rocks-5.1/?.lua;/Users/aaronhunt/.cache/nvim/packer_hererocks/2.1.1713484068/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/aaronhunt/.cache/nvim/packer_hererocks/2.1.1713484068/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["bufferline.nvim"] = {
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot-cmp"] = {
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16copilot_cmp\frequire\0" },
    load_after = {
      ["copilot.lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/copilot-cmp",
    url = "https://github.com/zbirenbaum/copilot-cmp"
  },
  ["copilot.lua"] = {
    after = { "copilot-cmp" },
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  harpoon = {
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["indent-blankline.nvim"] = {
    after_files = { "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim/after/plugin/commands.lua" },
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp-zero.nvim"] = {
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lualine.nvim"] = {
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nightfox.nvim"] = {
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["null-ls.nvim"] = {
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-highlight-colors"] = {
    loaded = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/start/nvim-highlight-colors",
    url = "https://github.com/brenoprata10/nvim-highlight-colors"
  },
  ["nvim-lsp-file-operations"] = {
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    config = { "\27LJ\2\nE\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\24lsp-file-operations\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/nvim-lsp-file-operations",
    url = "https://github.com/antosha417/nvim-lsp-file-operations"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-surround"] = {
    loaded = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-ts-context-commentstring"] = {
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["render-markdown"] = {
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/render-markdown",
    url = "https://github.com/MeanderingProgrammer/markdown.nvim"
  },
  ["rose-pine"] = {
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["telescope.nvim"] = {
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0 colorscheme tokyonight-moon\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  typr = {
    commands = { "Typr", "TyprStats" },
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ttypr\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/typr",
    url = "https://github.com/nvzone/typr"
  },
  undotree = {
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-bbye"] = {
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/vim-bbye",
    url = "https://github.com/moll/vim-bbye"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-tmux-navigator"] = {
    cond = { "\27LJ\2\n\21\0\0\1\1\0\0\3-\0\0\0\19\0\0\0L\0\2\0\0\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/opt/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  volt = {
    loaded = true,
    path = "/Users/aaronhunt/.local/share/nvim/site/pack/packer/start/volt",
    url = "https://github.com/nvzone/volt"
  }
}

time([[Defining packer_plugins]], false)
-- Conditional loads
time([[Conditional loading of tokyonight.nvim]], true)
  require("packer.load")({"tokyonight.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of tokyonight.nvim]], false)
time([[Conditional loading of nightfox.nvim]], true)
  require("packer.load")({"nightfox.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of nightfox.nvim]], false)
time([[Conditional loading of null-ls.nvim]], true)
  require("packer.load")({"null-ls.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of null-ls.nvim]], false)
time([[Conditional loading of vim-bbye]], true)
  require("packer.load")({"vim-bbye"}, {}, _G.packer_plugins)
time([[Conditional loading of vim-bbye]], false)
time([[Conditional loading of vim-tmux-navigator]], true)
  require("packer.load")({"vim-tmux-navigator"}, {}, _G.packer_plugins)
time([[Conditional loading of vim-tmux-navigator]], false)
time([[Conditional loading of nvim-lsp-file-operations]], true)
  require("packer.load")({"nvim-lsp-file-operations"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-lsp-file-operations]], false)
time([[Conditional loading of copilot-cmp]], true)
  require("packer.load")({"copilot-cmp"}, {}, _G.packer_plugins)
time([[Conditional loading of copilot-cmp]], false)
time([[Conditional loading of copilot.lua]], true)
  require("packer.load")({"copilot.lua"}, {}, _G.packer_plugins)
time([[Conditional loading of copilot.lua]], false)
time([[Conditional loading of nvim-tree.lua]], true)
  require("packer.load")({"nvim-tree.lua"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-tree.lua]], false)
time([[Conditional loading of undotree]], true)
  require("packer.load")({"undotree"}, {}, _G.packer_plugins)
time([[Conditional loading of undotree]], false)
time([[Conditional loading of nvim-treesitter-context]], true)
  require("packer.load")({"nvim-treesitter-context"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-treesitter-context]], false)
time([[Conditional loading of bufferline.nvim]], true)
  require("packer.load")({"bufferline.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of bufferline.nvim]], false)
time([[Conditional loading of nvim-ts-context-commentstring]], true)
  require("packer.load")({"nvim-ts-context-commentstring"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-ts-context-commentstring]], false)
time([[Conditional loading of nvim-web-devicons]], true)
  require("packer.load")({"nvim-web-devicons"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-web-devicons]], false)
time([[Conditional loading of gitsigns.nvim]], true)
  require("packer.load")({"gitsigns.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of gitsigns.nvim]], false)
time([[Conditional loading of harpoon]], true)
  require("packer.load")({"harpoon"}, {}, _G.packer_plugins)
time([[Conditional loading of harpoon]], false)
time([[Conditional loading of alpha-nvim]], true)
  require("packer.load")({"alpha-nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of alpha-nvim]], false)
time([[Conditional loading of indent-blankline.nvim]], true)
  require("packer.load")({"indent-blankline.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of indent-blankline.nvim]], false)
time([[Conditional loading of lsp-zero.nvim]], true)
  require("packer.load")({"lsp-zero.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of lsp-zero.nvim]], false)
time([[Conditional loading of render-markdown]], true)
  require("packer.load")({"render-markdown"}, {}, _G.packer_plugins)
time([[Conditional loading of render-markdown]], false)
time([[Conditional loading of rose-pine]], true)
  require("packer.load")({"rose-pine"}, {}, _G.packer_plugins)
time([[Conditional loading of rose-pine]], false)
time([[Conditional loading of telescope.nvim]], true)
  require("packer.load")({"telescope.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of telescope.nvim]], false)
time([[Conditional loading of lualine.nvim]], true)
  require("packer.load")({"lualine.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of lualine.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'TyprStats', function(cmdargs)
          require('packer.load')({'typr'}, { cmd = 'TyprStats', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'typr'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TyprStats ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Typr', function(cmdargs)
          require('packer.load')({'typr'}, { cmd = 'Typr', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'typr'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Typr ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)


_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
