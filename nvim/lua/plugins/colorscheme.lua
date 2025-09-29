return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "frappe",
      no_italic = true,
      no_bold = false,
      no_underline = false,
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
    })
    vim.cmd.colorscheme 'catppuccin'
  end
}