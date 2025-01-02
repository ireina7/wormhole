local M = {}

function M.setup()
    local feline = require('feline')
    feline.setup()
    feline.use_theme('default')

    -- for lsp status notification display
    require('fidget').setup {
        notification = {
            window = { winblend = 0 }
        }
    }
end

return M
