return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine = require("lualine")
    vim.opt.laststatus = 3
    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
        globalstatus = false,
      },
      sections = {
        lualine_a = { "mode" }, -- This will show vim mode including macro recording
        lualine_b = { "branch" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
