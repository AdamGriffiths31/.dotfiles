return {
  {
    'williamboman/mason.nvim',
    config = function()
      local ok_mason, mason = pcall(require, "mason")
      if not ok_mason then
        vim.notify("mason not found", vim.log.levels.ERROR)
        return
      end
      
      mason.setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {}
  }
}