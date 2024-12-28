local M = {}

function M.setup()
    vim.opt.clipboard = 'unnamedplus' -- use system clipboard
    vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
    vim.opt.mouse = 'a'

    -- Tab
    vim.opt.tabstop = 4 -- number of visual spaces per TAB
    vim.opt.softtabstop = 4 -- number of spacesin tab when editing
    vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
    vim.opt.expandtab = true -- tabs are spaces, mainly because of python
    vim.opt.autoindent = true

    -- UI config
    vim.opt.number = true -- show absolute number
    vim.opt.relativenumber = true -- add numbers to each line on the left side
    vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
    vim.opt.splitbelow = true -- open new vertical split bottom
    vim.opt.splitright = true -- open new horizontal splits right
    -- vim.opt.termguicolors = true        -- enable 24-bit RGB color in the TUI
    vim.opt.showmode = false -- we are experienced, wo don't need the "-- INSERT --" mode hint

    -- Searching
    vim.opt.incsearch = true -- search as characters are entered
    vim.opt.hlsearch = false -- do not highlight matches
    vim.opt.ignorecase = true -- ignore case in searches by default
    vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

    -- Folding
    --vim.opt.foldmethod = "expr"
    --vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    --vim.opt.foldtext = ""
    --vim.opt.foldlevel = 99
    --vim.opt.foldlevelstart = 1
    --vim.opt.foldnestmax = 4
end


return M
