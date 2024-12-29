local M = {}

function M.setup()
    require('nvim-autopairs').setup()
    require("ibl").setup {
        exclude = {
            filetypes = {
                "dashboard",
            },
        },
    }

    -- complete when selecting method
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

return M