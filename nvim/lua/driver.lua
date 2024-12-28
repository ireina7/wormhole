Driver = {}
function Driver.init()
    require('plugins').setup()
    require('options').setup()
    require('keymaps').setup()
    require('theme').setup()
    require('prompt').setup()
    require('statusbar').setup()
    require('lsp').setup()
    require('board').setup()
    require('edit').setup()
end

return Driver
