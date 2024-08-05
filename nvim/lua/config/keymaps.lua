-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- init.lua
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Keybinding for ToggleTermFloat
map("n", "<C-\\>", "<cmd>ToggleTerm direction=float<cr>", opts)
-- Hide Terminal in ToggleTerm
map("t", "<C-\\>", "<cmd>ToggleTerm<cr>", opts)

-- For isort
vim.api.nvim_set_keymap("n", "<leader>fi", ":Isort<CR>", { noremap = true, silent = true })

-- Window resizing keymaps
map("n", "<leader>wh", "<cmd>vertical resize -3<CR>", opts)
map("n", "<leader>wl", "<cmd>vertical resize +3<CR>", opts)
map("n", "<leader>wk", "<cmd>resize +3<CR>", opts)
map("n", "<leader>wj", "<cmd>resize -3<CR>", opts)

map("n", "<leader>wf", ":tab split<CR>", opts)
map("n", "<leader>wc", ":tabc<CR>", opts)

-- Code runner
map("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false })
map("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false })
map("n", "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
map("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
map("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
map("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
map("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })

-- lazygit override
map("n", "<leader>gg", ":!tmux new-window -c " .. vim.fn.getcwd() .. " -- lazygit <CR><CR>", { silent = true })
