local M = {}

function M.setup()
    vim.g.mapleader = " "

    local keymap = vim.keymap
    local builtin = require('telescope.builtin')

    -- visual line
    keymap.set("v", "J", ":m '>+1<CR>gv=gv")
    keymap.set("v", "K", ":m '<-2<CR>gv=gv")

    keymap.set("n", "<leader>sv", "<C-w>v")
    keymap.set("n", "<leader>sh", "<C-w>s")

    keymap.set("n", "<leader>nh", ":nohl<CR>")

    -- nvim-tree
    keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
    keymap.set("n", "<C-Up>", "<C-w>k")
    keymap.set("n", "<C-Down>", "<C-w>j")
    keymap.set("n", "<C-Left>", "<C-w>h")
    keymap.set("n", "<C-Right>", "<C-w>l")

    -- comment
    keymap.set("n", "<C-/>", "gcc")
    keymap.set("n", "<S-Right>", ":bnext<CR>")
    keymap.set("n", "<S-Left>", ":bprevious<CR>")

    vim.cmd([[
nmap <F9> <cmd>call vimspector#Launch()<cr>
nmap <F5> <cmd>call vimspector#StepOver()<cr>
nmap <F8> <cmd>call vimspector#Reset()<cr>
nmap <F11> <cmd>call vimspector#StepOver()<cr>")
nmap <F12> <cmd>call vimspector#StepOut()<cr>")
nmap <F10> <cmd>call vimspector#StepInto()<cr>")
    ]])
    keymap.set('n', "Db", ":call vimspector#ToggleBreakpoint()<cr>")
    keymap.set('n', "Dw", ":call vimspector#AddWatch()<cr>")
    keymap.set('n', "De", ":call vimspector#Evaluate()<cr>")

    keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true })
    keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
    keymap.set("n", "<space>a", vim.lsp.buf.code_action, { noremap = true, silent = true })
    keymap.set('n', 'gr', builtin.lsp_references, { noremap = true, silent = true })

    keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    keymap.set('n', '<leader>fd', "<cmd>Telescope diagnostics<CR>", { desc = 'Telescope diagnostics' })

    -- vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
end


return M




