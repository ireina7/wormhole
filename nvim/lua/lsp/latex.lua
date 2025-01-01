local M = {
    on_attach = require('lsp/lang').on_attach,
    settings = {
        texlab = {
            bibtexFormatter = "texlab",
            build = {
                args = { "-pdf", "-xelatex", "-interaction=nonstopmode", "-synctex=1", "%f" },
                executable = "latexmk",
                forwardSearchAfter = false,
                onSave = true
            },
            chktex = {
                onEdit = false,
                onOpenAndSave = true,
            },
            diagnosticsDelay = 300,
            formatterLineLength = 80,
            forwardSearch = {
                args = {}
            },
            latexFormatter = "latexindent",
            latexindent = {
                modifyLineBreaks = false
            }
        },
    }
}


return M
