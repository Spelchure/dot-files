local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

-- https://github.com/prettier-solidity/prettier-plugin-solidity

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup {
  debug = false,
  sources = {
    formatting.prettier.with {

      extra_filetypes = { "toml" },
    },
    -- Python
    formatting.black,
    formatting.stylua,
    diagnostics.pylint,
    diagnostics.mypy,
    -- Javascript/Typescript
    code_actions.eslint,
    -- Golang
    formatting.goimports,
    diagnostics.golangci_lint,
    -- Java
    formatting.google_java_format,
    -- Yaml
    diagnostics.yamllint,
    --formatting.yamlfmt, -- Not compatible some linting issues 
    diagnostics.cmake_lint,
    formatting.cmake_format
  },
  -- format on save
  on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                  vim.lsp.buf.format({bufnr = bufnr})
              end,
          })
      end
  end
}
