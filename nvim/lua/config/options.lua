-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.breakindent = true
vim.opt.scrolloff = 10
vim.o.tabstop = 4

-- nvim will auto close current preview window when changing
-- from Markdown buffer to another buffer
-- default: 0
vim.g.mkdp_auto_start = 0
-- set to 1, nvim will open the preview window after entering the Markdown buffer
-- default: 0
vim.g.mkdp_auto_close = 0

-- Configure folding to use Treesitter
vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldexpr = "v:lnum==1?'>1':getline(v:lnum)=~'import'?1:nvim_treesitter#foldexpr()"

-- reduces leader ping
vim.opt.timeoutlen = 5 -- or 500 (Default: 1000)
