return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local ok_telescope, telescope = pcall(require, "telescope")
      if not ok_telescope then
        vim.notify("Telescope not found", vim.log.levels.ERROR)
        return
      end
      
      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git", "target", "build", "dist", "*.o", "*.so", "*.a", "vendor" },
          layout_config = {
            horizontal = {
              preview_width = 0.6,
            },
          },
        },
      })

      vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
      vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
      vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
      vim.keymap.set('n', '<leader>sw', '<cmd>Telescope grep_string<cr>')
      vim.keymap.set('n', '<leader>jl', '<cmd>Telescope jumplist<cr>')
      vim.keymap.set('n', '<leader>gs', '<cmd>Telescope git_status<cr>')
    end
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
      local ok_telescope, telescope = pcall(require, "telescope")
      if not ok_telescope then
        vim.notify("Telescope file-browser extension not found", vim.log.levels.ERROR)
        return
      end
      
      telescope.load_extension("file_browser")
      vim.keymap.set('n', '<leader>fb', '<cmd>Telescope file_browser<cr>')
    end
  }
}
