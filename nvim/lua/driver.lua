M = {}
function M.setup()
    require('plugin').setup()
    require('lsp').setup()
    require('edit').setup()
    require('options').setup()
    require('keybind').setup()
    require('layout').setup()
end

return M
