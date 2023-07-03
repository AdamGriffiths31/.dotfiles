local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

load('adam.settings')
load('adam.keymaps')
load('adam.plugins')

vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

vim.cmd.colorscheme "catppuccin-mocha"
