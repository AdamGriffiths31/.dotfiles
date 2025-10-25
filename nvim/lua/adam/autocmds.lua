-- Create augroup for better organization
local augroup = vim.api.nvim_create_augroup('AdamAutocmds', { clear = true })

-- LSP formatting on save (all file types)
vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup,
    pattern = '*',
    callback = function(event)
        -- Only format if LSP client is attached and supports formatting
        local bufnr = event.buf

        -- Check if buffer is valid and loaded
        if not vim.api.nvim_buf_is_valid(bufnr) or not vim.api.nvim_buf_is_loaded(bufnr) then
            return
        end

        local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
        
        for _, client in pairs(clients) do
            if client.server_capabilities.documentFormattingProvider then
                local ok, result = pcall(vim.lsp.buf.format, { 
                    async = false, 
                    bufnr = bufnr,
                    timeout_ms = 2000,
                })
                if not ok then
                    vim.notify("Formatting failed: " .. tostring(result), vim.log.levels.WARN)
                end
                break
            end
        end
    end,
    desc = 'Format buffer with LSP on save'
})

-- Go-specific: organize imports on save
vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup,
    pattern = '*.go',
    callback = function(event)
        local bufnr = event.buf

        -- Check if buffer is valid and loaded
        if not vim.api.nvim_buf_is_valid(bufnr) or not vim.api.nvim_buf_is_loaded(bufnr) then
            return
        end

        local params = vim.lsp.util.make_range_params()
        params.context = {only = {"source.organizeImports"}}
        
        -- Add timeout to prevent hanging
        local ok, result = pcall(vim.lsp.buf_request_sync, bufnr, "textDocument/codeAction", params, 1000)
        if not ok then
            vim.notify("Failed to organize imports: " .. tostring(result), vim.log.levels.WARN)
            return
        end
        
        for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    local client = vim.lsp.get_client_by_id(cid)
                    local enc = (client or {}).offset_encoding or "utf-16"
                    local apply_ok, apply_err = pcall(vim.lsp.util.apply_workspace_edit, r.edit, enc)
                    if not apply_ok then
                        vim.notify("Failed to apply workspace edit: " .. tostring(apply_err), vim.log.levels.WARN)
                    end
                end
            end
        end
    end,
    desc = 'Organize imports in Go files on save'
})