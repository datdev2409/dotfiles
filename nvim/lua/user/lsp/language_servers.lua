require("nvim-lsp-installer").setup {}
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {'clangd', 'pyright', 'intelephense', 'emmet_ls', 'tsserver'}
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    single_file_support = true
  }

end

require('lspconfig').emmet_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'php', 'ejs'},
}

require('lspconfig').intelephense.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  single_file_support = true
}
