local M = {}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)



-- Plugins
M.catppuccin = {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
}

M.mason = {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" }
}

M.lsp_config = {
    "neovim/nvim-lspconfig",
}

M.inlay_hint = {
    "MysticalDevil/inlay-hints.nvim",
    event = "LspAttach",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
        require("inlay-hints").setup()
    end
}

M.rustaceanvim = {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
}

M.autopairs = {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
}

M.dashboard = {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { {'nvim-tree/nvim-web-devicons'} }
}

M.telescope = {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    -- branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
}

M.indent_blankline = {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
}

M.nvim_tree = {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
}

M.nvim_cmp = {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
}

function M.setup()
    require("lazy").setup({
        M.catppuccin,
        M.mason,
        "williamboman/mason-lspconfig.nvim",
        M.lsp_config,
        M.nvim_cmp,
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
        M.inlay_hint,
        'feline-nvim/feline.nvim',
        'nvim-tree/nvim-web-devicons',
        M.autopairs,
        M.dashboard,
        M.telescope,
        'mfussenegger/nvim-dap',
        'j-hui/fidget.nvim',
        M.indent_blankline,
        M.nvim_tree,
    })
end

return M
