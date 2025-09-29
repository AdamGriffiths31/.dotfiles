local opts = { noremap = true, silent = true }

-- Basic clipboard interaction
vim.keymap.set({ 'n', 'x' }, '<C-c>', '"*y')
vim.keymap.set({ 'n', 'x' }, '<C-p>', '"*p')

-- Navigation
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Exit on jj and jk
vim.keymap.set("n", "j", "gj", opts)
vim.keymap.set("n", "k", "gk", opts)
vim.keymap.set("i", "jj", "<ESC>", opts)
vim.keymap.set("i", "jk", "<ESC>", opts)

-- Fast saving
vim.keymap.set("n", "<Leader>w", ":write!<CR>", opts)
vim.keymap.set("n", "<Leader>q", ":q!<CR>", opts)

-- Visually select lines, and move them up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Debug mappings (with safe loading)
local function safe_dap_keymap(key, command, desc, plugin)
  plugin = plugin or 'dap'
  vim.keymap.set("n", key, function()
    local ok, dap_module = pcall(require, plugin)
    if not ok then
      vim.notify(plugin .. " not loaded", vim.log.levels.WARN)
      return
    end
    if type(command) == "string" then
      dap_module[command]()
    elseif type(command) == "function" then
      command(dap_module)
    end
  end, { desc = desc or ("DAP " .. command), noremap = true, silent = true })
end

safe_dap_keymap("<F5>", "continue", "DAP Continue")
safe_dap_keymap("<F10>", "step_over", "DAP Step Over")
safe_dap_keymap("<F11>", "step_into", "DAP Step Into")
safe_dap_keymap("<F12>", "step_out", "DAP Step Out")
safe_dap_keymap("<leader>db", "toggle_breakpoint", "DAP Toggle Breakpoint")
safe_dap_keymap("<leader>dB", function(dap) 
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, "DAP Conditional Breakpoint")
safe_dap_keymap("<leader>dr", function(dap) dap.repl.open() end, "DAP Open REPL")
safe_dap_keymap("<leader>dl", "run_last", "DAP Run Last")
safe_dap_keymap("<leader>dt", "toggle", "DAP UI Toggle", "dapui")
safe_dap_keymap("<leader>dx", "terminate", "DAP Terminate")
