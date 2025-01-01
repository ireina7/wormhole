local M = {
    on_attach = require('lsp/lang').on_attach,
    settings = {
        texlab = {
            build = {
                onSave = true,
            },
        },
    }
}


return M
