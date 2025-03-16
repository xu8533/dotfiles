-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set
local del = vim.keymap.del

map({ "n", "x" }, ";", ":", { desc = "quick enter command mode" })

-- 调整窗口左右大小
del("n", "<C-Left>")
del("n", "<C-Right>")
map("n", "<S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
