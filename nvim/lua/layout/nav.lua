local M = {}

function M.setup()
    require('nvim-navic').setup {}
    vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
end


return M
