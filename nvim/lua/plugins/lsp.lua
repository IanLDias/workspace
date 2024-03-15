local M = {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    "jose-elias-alvarez/null-ls.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
        yamlls = {
          -- Have to add this for yamlls to understand that we support line folding
          capabilities = {
            textDocument = {
              foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
              },
            },
          },
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.yaml.schemas = new_config.settings.yaml.schemas or {}
            vim.list_extend(new_config.settings.yaml.schemas, require("schemastore").yaml.schemas())
          end,
          settings = {
            redhat = { telemetry = { enabled = false } },
            yaml = {
              keyOrdering = false,
              format = {
                enable = true,
              },
              validate = true,
              schemaStore = {
                -- Must disable built-in schemaStore support to use
                -- schemas from SchemaStore.nvim plugin
                enable = false,
                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                url = "",
              },
            },
          },
        },
      },
    },
  },
}

function M.on_attach(client, bufnr)
  print("Attached " .. client.name)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(input)
      vim.lsp.buf.format({ id = client.id, async = input.bang })
    end, { bang = true, range = true, desc = "Format using lsp" })

    vim.keymap.set({ "n", "x" }, "<leader>df", "<cmd>Format!<cr>", { buffer = bufnr })

    local augroup = vim.api.nvim_create_augroup("LspFormat", {})
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePost", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        M.format_asynchronously(bufnr)
      end,
    })
  end
end

function M.start_servers()
  local use_solargraph_diagnostics = true
  require("lspconfig").solargraph.setup({
    cmd = { "bundle", "exec", "solargraph", "stdio" },
    on_attach = M.on_attach,
    settings = {
      solargraph = {
        diagnostics = use_solargraph_diagnostics,
      },
    },
    init_options = {
      formatting = use_solargraph_diagnostics,
    },
  })

  -- Null ls (treat things as if they were LSP)
  local builtins = require("null-ls.builtins")
  local use_bundler = function(provided_args)
    return {
      command = "bundle",
      args = vim.list_extend({ "exec", "rubocop" }, provided_args),
    }
  end
  require("null-ls").setup({
    on_attach = M.on_attach,
    sources = {
      builtins.diagnostics.rubocop.with(use_bundler(builtins.diagnostics.rubocop._opts.args)),
      builtins.formatting.rubocop.with(use_bundler(builtins.formatting.rubocop._opts.args)),
      builtins.diagnostics.erb_lint.with(use_bundler(builtins.diagnostics.erb_lint._opts.args)),
      builtins.formatting.erb_lint.with(use_bundler(builtins.formatting.erb_lint._opts.args)),
      -- builtins.completion.spell,
    },
  })
end

function M.config()
  M.start_servers()

  vim.lsp.set_log_level("debug")
  vim.diagnostic.config({
    -- virtual_text = false,
    virtual_text = {
      source = "always", -- Or "if_many"
      prefix = "●",    -- Could be '■', '▎', 'x'
    },
    severity_sort = true,
    float = {
      source = "always", -- Or "if_many"
    },
  })

  -- vim.cmd [[ autocmd! CursorHold * lua require'plugins/lsp'.print_diagnostics() ]]
  -- if vim.diagnostic.virtual_text == false then
  --   vim.cmd [[ autocmd! CursorHold * lua vim.diagnostic.open_float() ]]
  -- end
end

return M
