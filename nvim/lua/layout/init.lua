local M = {}

function M.setup()
    require('layout/theme').setup()
    require('layout/statusbar').setup()
    require('layout/tree').setup()
    require('layout/board').setup()
    require('layout/outline').setup()
    require('layout.nav').setup()
end


return M
