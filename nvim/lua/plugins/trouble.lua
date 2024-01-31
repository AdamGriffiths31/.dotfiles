vim.keymap.set("n", "<leader>tt", function()
    require("trouble").toggle()
end)

vim.keymap.set("n", "[t", function()
    require("trouble").next({ skip_groups = true, jump = true });
end)

vim.keymap.set("n", "]t", function()
    require("trouble").previous({ skip_groups = true, jump = true });
end)

require("trouble").setup({
    icons = false,
    fold_open = "v", -- icon used for open folds
    fold_closed = ">", -- icon used for closed folds
    indent_lines = false, -- add an indent guide below the fold icons
    signs = {
        -- icons / text used for a diagnostic
        error = "e",
        warning = "w",
        hint = "h",
        information = "i"
    },
    use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
})

