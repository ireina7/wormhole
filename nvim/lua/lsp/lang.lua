local M = {}

local navic = require("nvim-navic")

M.on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end


return M
