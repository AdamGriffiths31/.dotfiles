return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  version = false,
  config = function()
    local ok, configs = pcall(require, 'nvim-treesitter.configs')
    if not ok then
      vim.notify("nvim-treesitter not found", vim.log.levels.ERROR)
      return
    end

    configs.setup {
      ensure_installed = { "go", "gomod", "gowork", "gotmpl" },
      sync_install = false,
      ignore_install = { "javascript" },
      
      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    }
  end
}
