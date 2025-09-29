return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'catppuccin'
      },
      sections = {
        lualine_z = {'os.date("%m/%d %H:%M")'}
      }
    })
  end
}