local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local saga = require('lspsaga')
saga.init_lsp_saga()

-- Suggestions
vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', { silent = true,noremap = true })
vim.keymap.set('v', '<leader>ca', '<cmd><C-U>Lspsaga range_code_action<CR>', { silent = true,noremap = true })

-- Hover Docs	
vim.api.nvim_set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', { noremap = true, silent = true })

-- Signature help
vim.api.nvim_set_keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', { noremap = true, silent = true })

-- Def and Reference
vim.api.nvim_set_keymap('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>', { noremap = true, silent = true })


-- ESLint format on save
nvim_lsp.eslint.setup{}
vim.cmd('autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js,*.cjs EslintFixAll')

-- CSS Modules
nvim_lsp.cssmodules_ls.setup{
	filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript', 'javascriptreact', 'javascript.jsx' }
}

-- TailWindCSS
nvim_lsp.tailwindcss.setup{
	filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript', 'javascriptreact', 'javascript.jsx' }
}

-- TypeScript
-- nvim_lsp.tsserver.setup {
-- 	filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript', 'javascriptreact', 'javascript.jsx' },
--   on_attach = on_attach,
-- 	capabilities = capabilities
-- } nvim_lsp.tsserver.setup {}
-- nvim_lsp.tsserver.setup()
-- vim.cmd('COQnow -s')
