require("adam.remap")
require("adam.set")

vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

vim.opt.completeopt={"menu", "menuone", "noselect"} -- setting vim values
