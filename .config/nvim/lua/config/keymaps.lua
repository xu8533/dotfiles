-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set
local del = vim.keymap.del

map({ "n", "x" }, ";", ":", { desc = "快速进入命令行模式" })

-- 调整窗口左右大小
del("n", "<C-Left>")
del("n", "<C-Right>")
map("n", "<S-Left>", "<cmd>vertical resize -2<cr>", { desc = "缩小窗口宽度" })
map("n", "<S-Right>", "<cmd>vertical resize +2<cr>", { desc = "增加窗口宽度" })
map("n", "<Localleader>br", "<cmd>tabnew#<cr>", { desc = "恢复最近关闭的tab" })
