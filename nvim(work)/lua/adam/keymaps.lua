local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Map leader to 'space'
vim.g.mapleader = " "

-- Basic clipboard interaction
vim.keymap.set({'n', 'x'}, '<C-c>', '"*y')
vim.keymap.set({'n', 'x'}, '<C-p>', '"*p')

-- Navigation
vim.keymap.set("n","<leader>pv", vim.cmd.Ex)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Exit on jj and jk
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("i", "jj", "<ESC>", opts)
keymap("i", "jk", "<ESC>", opts)

-- Fast saving
keymap("n", "<Leader>w", ":write!<CR>", opts)
keymap("n", "<Leader>q", ":q!<CR>", opts)

-- Visually select lines, and move them up/down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Open a new vertical split terminal
keymap('n', '<Leader>vt', ':vsplit term://$SHELL <CR>', opts)
keymap('n', '<Leader>t', ':split term://$SHELL | resize 10<CR>', opts)

keymap('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>',opts)
