-- Open lazygit with toggleterm
return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      autochdir = true,
      direction = "float",
      config = function()
        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

        _G._lazygit_toggle = function()
          lazygit:toggle()
        end

        vim.api.nvim_set_keymap("n", "<leader>gt", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
      end,
    },
  },
}
