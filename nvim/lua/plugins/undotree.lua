local Plugin = {'mbbill/undotree'}

Plugin.cmd = {'Undotree'}

function Plugin.init()
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
end

function Plugin.config()
  require('undotree').load_extension('fzf')
end

return Plugin
