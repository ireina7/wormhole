local M = {
    init_options = {
        fallbackFlags = {'--std=c++20'}
    },

    on_attach = require('lsp/lang').on_attach,
}

return M
