local colors = require("tokyonight.colors").setup()

return {
  {
    "petertriho/nvim-scrollbar",
    opts = {
      handle = {
        blend = 0,
        color = colors.fg,
        -- text = " ",
      },
      marks = {
        Cursor = {
          text = " ",
        },
        Search = { color = colors.orange },
      },
    },
  },
  {
    "nvim-pack/nvim-spectre",
  },
  {
    "pechorin/any-jump.vim"
  }
}
