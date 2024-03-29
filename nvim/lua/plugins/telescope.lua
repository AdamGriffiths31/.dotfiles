vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<leader>sw', '<cmd>Telescope grep_string<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope file_browser<cr>')
vim.keymap.set('n', '<leader>jl', '<cmd>Telescope jumplist<cr>')

vim.keymap.set('n', '<leader>gs', '<cmd>Telescope git_status<cr>')


require("telescope").load_extension "file_browser"
