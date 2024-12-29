M = {}
function M.setup()
    require('plugin').setup()
    require('lsp').setup()
    require('options').setup()
    require('keymap').setup()
    require('layout').setup()
end

return M
