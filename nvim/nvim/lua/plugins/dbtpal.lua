return {
  "PedramNavid/dbtpal",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  ft = {
    "sql",
    "md",
    "yaml",
  },
  keys = {},
  config = function()
    require("dbtpal").setup({
      path_to_dbt = "dbt",
      -- path_to_dbt_project = vim.fn.expand("dbt"),
      -- path_to_dbt_profiles_dir = vim.fn.expand("dbt"),
      extended_path_search = true,
      protect_compiled_files = true,
    })
    require("telescope").load_extension("dbtpal")
  end,
}
