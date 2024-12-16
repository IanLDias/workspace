return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true },
      ensure_installed = { "python" },
    },
  },
  {
    "LiadOz/nvim-dap-repl-highlights",
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dap-repl",
        callback = function()
          vim.treesitter.language.register("python", "dap-repl")
        end,
      })
      require("nvim-dap-repl-highlights").setup()
    end,
  },
}
