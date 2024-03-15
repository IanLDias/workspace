return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      highlight = {
        enable = true,
        custom_captures = {
          ["custom.method.name"] = "TSCustomMethodName",
          ["custom.keyword_parameter.name"] = "TSCustomKeywordParameterName",
          ["custom.keyword_parameter.value"] = "TSCustomKeywordParameterValue",
          ["custom.class.method.invocation"] = "TSCustomClassMethodInvocation",
          ["custom.method"] = "TSCustomMethod",
        },
      },
      indent = { enable = true, disable = { "python" } },
      context_commentstring = { enable = true, enable_autocmd = false },
      matchup = { -- integrate with vim-matchup
        enable = true,
      },
      ensure_installed = {
        "bash",
        "c",
        "embedded_template",
        "html",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "nix",
        "yaml",
        "python",
        "query",
        "ruby",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
      incremental_selection = {
        enable = false,
      },
      endwise = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.install").compilers = { 'clang++'}
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
