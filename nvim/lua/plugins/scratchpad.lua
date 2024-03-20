return {
  {
    "mtth/scratch.vim",
    config = function()
      vim.g.scratch_persistence_file = "~/.config/docs/scratchpad/scratchpad.txt"
    end,
    keys = {
      { "<leader>tf", "<cmd>Scratch<cr>", desc = "Open ScratchPad" },
    },
  },
}
