return {
  {
    "FraserLee/ScratchPad",
    -- There's no setup function for scratchpad, so unable to use the typical 'opts' config
    config = function()
      vim.g.scratchpad_autostart = 0
      vim.g.scratchpad_autofocus = 1
    end,
    keys = {
      { "<leader>tf", "<cmd>ScratchPad<cr>", desc = "Open ScratchPad" },
    },
  },
}
