return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-neotest/neotest-python",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          args = { "-v" }, -- get more diff
          python = "python",
        }),
      },
      output = {
        -- disable pop-up with failing test info (prefer virtual text)
        open_on_run = false,
      },
      quickfix = {
        enabled = false,
      },
    })
  end,
  defaults = {
    mappings = {
      run = {},
    },
  },
  keys = {
    {
      "<leader>td",
      function()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Test Debug",
    },
    {
      "<leader>tg",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run File",
    },
  },
  cmd = "Neotest",
}
