local Plugin = {'tpope/vim-fugitive'}

Plugin.cmd = {'Fugitive'}

function Plugin.init()
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
end

function Plugin.config()
  require('fugitive').load_extension('fzf')
end

return Plugin
