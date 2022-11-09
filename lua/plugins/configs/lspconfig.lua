local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

local M = {}
local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs

M.on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<Leader>fa', ':EslintFixAll<CR>:w<CR>', bufopts)
  if vim.g.vim_version > 7 then
    -- nightly
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  else
    -- stable
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end

  utils.load_mappings("lspconfig", { buffer = bufnr })
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

lspconfig.sumneko_lua.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

local flags = {
  debounce_text_changes = 150,
}

lspconfig.tsserver.setup{
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  flags = flags,
}

lspconfig.tailwindcss.setup{
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  flags = flags,
}

lspconfig.cssls.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  flags = flags,
}

lspconfig.cssmodules_ls.setup{
  on_attach = M.on_attach,
  flags = flags,
}

lspconfig.eslint.setup{
  on_attach = M.on_attach,
  flags = flags,
}

lspconfig.prismals.setup{
  on_attach = M.on_attach,
  flags = flags,
}

lspconfig.kotlin_language_server.setup{
  on_attach = M.on_attach,
  flags = flags
}

lspconfig.java_language_server.setup{
  on_attach = M.on_attach,
  flags = flags
}

lspconfig.gopls.setup{
  on_attach = M.on_attach,
  flags = flags,
}

lspconfig.sqlls.setup{
  on_attach = M.on_attach,
  flags = flags,
}

lspconfig.pyright.setup{
  on_attach = M.on_attach,
  flags = flags,
}

lspconfig.rust_analyzer.setup{
  on_attach = M.on_attach,
  flags = flags,
}

return M
