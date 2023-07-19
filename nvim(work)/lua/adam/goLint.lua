local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values

vim.api.nvim_create_user_command("GoLintErrors", function()
    -- Run your linting command and capture the output
    local lint_output = vim.fn.systemlist('golint .')

    -- Create a list of entries for the custom picker
    local entries = {}
    for _, line in ipairs(lint_output) do
        table.insert(entries, line)
    end

    local ts = function(opts)
        opts = opts or {}
        pickers.new(opts, {
            prompt_title = "Lint Issues",
            finder = finders.new_table {
                results = entries -- Pass the entries directly
            },
            sorter = conf.generic_sorter(opts),
        }):find()
    end

    -- to execute the function
    ts()
end, {})
