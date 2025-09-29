-- Set leader key first, before any plugins load
vim.g.mapleader = " "

require('config.lazy')
require('adam.settings')
require('adam.keymaps')
require('adam.autocmds')
