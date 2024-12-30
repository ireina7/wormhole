local M = {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=webkit",
        -- "-j4",
        -- "--fallback-style=llvm",
    },

    init_options = {
        fallbackFlags = { '--std=c++20' }
    },

    on_attach = require('lsp/lang').on_attach,
}

return M
