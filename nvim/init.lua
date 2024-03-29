local load = function(mod)
    package.loaded[mod] = nil
    require(mod)
end

load('adam.settings')
load('adam.keymaps')
load('plugins.telescope')
load('plugins.lsp')
load('plugins.cmp')
load('plugins.treesitter')
load('plugins.nvimDap')
load('plugins.fugitive')
load('plugins.colorscheme')
load('plugins.trouble')

vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*.go',
    callback = function()
        vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
    end
})
