return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gf', '<cmd>Git<cr>')
  end
}