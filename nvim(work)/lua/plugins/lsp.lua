vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
  local bufmap = function(mode, lhs, rhs)
    local opts = {buffer = true}
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- You can search each function in the help page.
  -- For example :help vim.lsp.buf.hover()

  bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
  bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
  bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
  bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
  bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
  bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
  bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
  bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
  bufmap({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
  bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
  bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
  bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

  bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
  bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')


   bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
  end
})

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    -- Replace these with whatever servers you want to install
    'gopls',
  }
})

local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
  local lspconfig = require('lspconfig')
  local lsp_defaults = lspconfig.util.default_config
  
  lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
  )

require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = lsp_capabilities,
    })
  end,
})


 local sign = function(opts)
    -- See :help sign_define()
    vim.fn.sign_define(opts.name, {
      texthl = opts.name,
      text = opts.text,
      numhl = ''
    })
  end

  sign({name = 'DiagnosticSignError', text = '✘'})
  sign({name = 'DiagnosticSignWarn', text = '▲'})
  sign({name = 'DiagnosticSignHint', text = '⚑'})
  sign({name = 'DiagnosticSignInfo', text = '»'})

  -- See :help vim.diagnostic.config()
  vim.diagnostic.config({
    virtual_text = {
        prefix = "✘"
    },
    severity_sort = true,
    float = {
      border = 'rounded',
      source = 'always',
    },
  })

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    {border = 'rounded'}
  )

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    {border = 'rounded'}
  )
