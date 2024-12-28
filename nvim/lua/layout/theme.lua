local M = {}

function M.setup()
    require("catppuccin").setup({
        flavour = "frappe",
        transparent_background = true
    })

    vim.cmd.colorscheme("catppuccin")
end


return M
