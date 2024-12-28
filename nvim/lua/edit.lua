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
end

return M
