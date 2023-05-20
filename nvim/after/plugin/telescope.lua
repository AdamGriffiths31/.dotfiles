local builtin = require('telescope.builtin') 
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
--Fuzzy search through the output of git ls-files command, respects .gitignore
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
