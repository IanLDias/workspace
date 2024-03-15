local nvim_lsp = require("lspconfig")
local null_ls = require("null-ls")

-- Configure black formatter for null-ls
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black.with({ filetypes = { "python" } }),
    null_ls.builtins.formatting.isort.with({ filetypes = { "python" } }),
    -- Add any other sources you want here...
  },
})

-- Configure pyright
-- nvim_lsp.pyright.setup({
--   on_attach = function(client)
--     print("Attached " .. client.name)
--
--     -- Enable formatting on save if the language server supports it
--     if client.resolved_capabilities.document_formatting then
--       vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]])
--     end
--   end,
-- })

return {}
-- Start any other servers you want here...
