return {
  'neovim/nvim-lspconfig',
  dependencies = { 'williamboman/mason-lspconfig.nvim' },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        local bufmap = function(mode, lhs, rhs)
          local opts = { buffer = true }
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
        bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
        bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
        bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
        bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
        bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
        bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
        bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
        bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
        bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
      end
    })

    vim.diagnostic.config({
      virtual_text = {
        prefix = '●',
        source = "if_many",
        spacing = 2,
        format = function(diagnostic)
          return diagnostic.message
        end,
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '✗',
          [vim.diagnostic.severity.WARN] = '⚠',
          [vim.diagnostic.severity.HINT] = '💡',
          [vim.diagnostic.severity.INFO] = 'ⓘ',
        },
      },
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
      vim.lsp.handlers.hover,
      { border = 'rounded' }
    )

    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
      vim.lsp.handlers.signature_help,
      { border = 'rounded' }
    )

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      },
      gopls = {
        settings = {
          gopls = {
            codelenses = { test = true },
            gofumpt = true,
            ["formatting.gofumpt"] = true,
            ["ui.completion.usePlaceholders"] = true,
            ["ui.diagnostic.staticcheck"] = true,
            ["ui.inlayhint.hints"] = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      }
    }

    local custom_init = function(client)
      client.config.flags = client.config.flags or {}
      client.config.flags.allow_incremental_sync = true
    end

    local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
    updated_capabilities.textDocument.completion.completionItem.snippetSupport = true
    updated_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

    local ok_cmp_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if ok_cmp_lsp then
      updated_capabilities = vim.tbl_deep_extend("force", updated_capabilities, cmp_nvim_lsp.default_capabilities())
    end
    updated_capabilities.textDocument.completion.completionItem.insertReplaceSupport = false
    updated_capabilities.textDocument.codeLens = { dynamicRegistration = false }

    local ok_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
    if not ok_mason_lsp then
      vim.notify("mason-lspconfig not found", vim.log.levels.ERROR)
      return
    end

    local ok_lspconfig, lspconfig = pcall(require, 'lspconfig')
    if not ok_lspconfig then
      vim.notify("nvim-lspconfig not found", vim.log.levels.ERROR)
      return
    end

    mason_lspconfig.setup({
      ensure_installed = { "lua_ls", "gopls" },
      handlers = {
        function(server_name)
          local config = servers[server_name] or {}
          
          if type(config) ~= "table" then
            config = {}
          end

          config = vim.tbl_deep_extend("force", {
            on_init = custom_init,
            capabilities = updated_capabilities,
          }, config)

          lspconfig[server_name].setup(config)
        end,
      }
    })
  end
}
