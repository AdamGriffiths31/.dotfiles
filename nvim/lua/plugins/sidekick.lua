return {
  "folke/sidekick.nvim",
  opts = {
    jump = { jumplist = true },
    signs = {
      enabled = true,
      icon = " ",
    },
    nes = {
      enabled = true,
      debounce = 100,
      diff = {
        inline = "words",
      },
    },
    cli = {
      watch = true,
      mux = {
        backend = "tmux",
        enabled = true,
      },
      win = {
        layout = "right",
        float = {
          width = 0.9,
          height = 0.9,
        },
      },
    },
  },
  keys = {
    {
      "<tab>",
      function()
        if not require("sidekick").nes_jump_or_apply() then
          return "<Tab>"
        end
      end,
      expr = true,
      desc = "Sidekick: Jump or apply suggestion",
    },
    {
      "<leader>ac",
      function()
        require("sidekick.cli").toggle({ name = "claude", focus = true })
      end,
      desc = "Sidekick: Toggle Claude",
    },
    {
      "<leader>ae",
      function()
        require("sidekick.cli").ask({ prompt = "explain", submit = true })
      end,
      desc = "Sidekick: Explain with Claude",
    },
    {
      "<leader>ar",
      function()
        require("sidekick.cli").ask({ prompt = "review", submit = true })
      end,
      desc = "Sidekick: Review with Claude",
    },
  },
}