-- In case you don't want to use `:LazyExtras`,
-- then you need to set the option below.
vim.g.lazyvim_picker = "fzf"

vim.g.maplocalleader = ","
local opt = vim.opt

opt.scrolloff = 8 --在光标上下各保存8行
opt.shiftwidth = 4 -- Size of an indent
opt.tabstop = 4 -- Number of spaces tabs count for
