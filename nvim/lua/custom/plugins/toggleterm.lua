-- lua/custom/plugins/toggleterm.lua
return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        direction = 'float',
      })

      -- Keybindings
      vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<CR>', { noremap = true, silent = true })
    end,
  },
}
