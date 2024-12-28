M = {}
function M.setup()
    require('plugins').setup()
    require('options').setup()
    require('keymaps').setup()
    require('layout').setup()
    require('prompt').setup()
    require('lsp').setup()
    require('edit').setup()
end

return M
