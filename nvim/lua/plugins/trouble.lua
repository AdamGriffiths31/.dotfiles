return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local ok, trouble = pcall(require, "trouble")
    if not ok then
      vim.notify("trouble not found", vim.log.levels.WARN)
      return
    end

    trouble.setup({
      icons = {
        indent = {
          fold_open = "v",
          fold_closed = ">",
        },
        folder_closed = ">",
        folder_open = "v",
      },
      signs = {
        error = "e",
        warning = "w",
        hint = "h",
        information = "i"
      },
    })

    vim.keymap.set("n", "<leader>tt", function()
      trouble.toggle("diagnostics")
    end)

    vim.keymap.set("n", "<leader>tl", function()
      trouble.toggle("lsp_document_symbols")
    end)

    vim.keymap.set("n", "[t", function()
      trouble.next({ skip_groups = true, jump = true });
    end)

    vim.keymap.set("n", "]t", function()
      trouble.previous({ skip_groups = true, jump = true });
    end)
  end
}

