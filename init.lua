vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

-- Windowing

local current_file = vim.b[0]

for k,v in pairs(current_file) do
  print(k, v)
end

-- Vertical split for essential files (Like the README, root build file, and any other deemed important)
vim.cmd("vsplit")

-- local deemed_important = {}

-- for k,v in pairs(deemed_important) do
  
-- end
vim.cmd("terminal")
vim.cmd("split")
vim.cmd("terminal lazygit")

vim.cmd("NvimTreeToggle")
vim.cmd("wincmd l")
