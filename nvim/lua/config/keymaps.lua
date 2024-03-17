-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- init.lua
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Keybinding for ToggleTermFloat
map("n", "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", opts)
-- Hide Terminal in ToggleTerm
map("t", "<leader>tt", "<C-\\><C-n><C-w>l", opts)

-- For isort
vim.api.nvim_set_keymap("n", "<leader>fi", ":Isort<CR>", { noremap = true, silent = true })

-- Copilot
local opts = { silent = true, script = true, expr = true }
--
map("i", "<C-p>", [[copilot#Previous()]], opts)
map("i", "<C-n>", [[copilot#Next()]], opts)
map("i", "<C-s>", [[copilot#Suggest()]], opts)
map("i", "<C-a>", [[copilot#Accept("\<CR>")]], opts)
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
