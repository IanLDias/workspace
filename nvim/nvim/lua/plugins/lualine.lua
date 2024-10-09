return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine = require("lualine")

    -- Set Neovim option to show statusline on all windows
    vim.opt.laststatus = 3

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
        globalstatus = false,
      },
      -- inactive_winbar = {
      --   lualine_a = { "filename" },
      --   lualine_c = { "branch" },
      -- },
    })
  end,
}
