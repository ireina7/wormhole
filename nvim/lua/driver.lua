M = {}
function M.setup()
    require('plugins').setup()
    require('lsp').setup()
    require('options').setup()
    require('keymaps').setup()
    require('layout').setup()
    require('prompt').setup()
    require('edit').setup()
end

return M
