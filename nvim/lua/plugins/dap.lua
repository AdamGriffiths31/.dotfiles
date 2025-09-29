return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local ok_dap, dap = pcall(require, 'dap')
      if not ok_dap then
        vim.notify("nvim-dap not found", vim.log.levels.ERROR)
        return
      end
      
      vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
      vim.fn.sign_define('DapBreakpointCondition', { text = '◐', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
      vim.fn.sign_define('DapLogPoint', { text = '◯', texthl = 'DapLogPoint', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DapStopped', linehl = 'DapStoppedLine', numhl = '' })
      vim.fn.sign_define('DapBreakpointRejected', { text = 'X', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
    end
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      local ok_dap, dap = pcall(require, 'dap')
      local ok_dapui, dapui = pcall(require, 'dapui')
      if not ok_dap or not ok_dapui then
        vim.notify("nvim-dap or nvim-dap-ui not found", vim.log.levels.ERROR)
        return
      end
      
      dapui.setup({
        icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
        mappings = {
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        element_mappings = {},
        expand_lines = vim.fn.has("nvim-0.7") == 1,
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.25 },
              "breakpoints",
              "stacks",
              "watches",
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              "repl",
              "console",
            },
            size = 0.25,
            position = "bottom",
          },
        },
        controls = {
          enabled = true,
          element = "repl",
          icons = {
            pause = "||",
            play = ">",
            step_into = "↓",
            step_over = "→",
            step_out = "↑",
            step_back = "←",
            run_last = "↻",
            terminate = "■",
          },
        },
        floating = {
          max_height = nil,
          max_width = nil,
          border = "single",
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        windows = { indent = 1 },
        render = {
          max_type_length = nil,
          max_value_lines = 100,
        }
      })

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    'leoluz/nvim-dap-go',
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function()
      local ok_dap_go, dap_go = pcall(require, 'dap-go')
      if not ok_dap_go then
        vim.notify("nvim-dap-go not found", vim.log.levels.ERROR)
        return
      end
      
      dap_go.setup({
        -- Remove remote debugging configuration for security
        -- Remote debugging should be configured manually when needed
        dap_configurations = {},
        delve = {
          path = "dlv",
          initialize_timeout_sec = 20,
          -- Use default port allocation instead of user-provided port
          port = "${port}",
          args = {},
          build_flags = "",
          detached = vim.fn.has("win32") == 0,
          cwd = nil,
        },
      })
    end
  }
}