local M = {}

function M.setup()
    require("nvim-tree").setup {
        view = {
            width = 32,
        },
    }
end


return M

