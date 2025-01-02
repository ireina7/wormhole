local M = {}


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
    lazy = false,   -- This plugin is already lazy
}

M.autopairs = {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
}

M.dashboard = {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
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

M.outline = {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
}

M.lsp_signature = {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
}

M.fidget = {
    "j-hui/fidget.nvim",
    opts = {
        -- options
    },
}

M.plugins = {
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
    M.indent_blankline,
    M.nvim_tree,
    "SmiteshP/nvim-navic",
    M.outline,
    M.lsp_signature,
    M.fidget,
}

function M.setup()
    require('plugins/lazy').setup() -- bootstrap
    require("lazy").setup(M.plugins)
end

return M
