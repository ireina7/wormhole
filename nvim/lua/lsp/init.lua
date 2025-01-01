local M = {}

local lspconfig = require('lspconfig')

--- Read configuration from TOML file
--- @return table
function M.read_conf()
    local toml = require('util/toml')
    local root = vim.fn.stdpath("config")
    if type(root) == 'table' then
        root = root[0]
    end

    local path = require('util/path').path_join(root, 'conf/lsp.toml')
    local file = io.open(path, 'r')
    if file == nil then
        error('failed to read lsp.toml')
    end
    local conf = file:read('*a')
    conf = toml.parse(conf)
    -- vim.print(conf)
    return conf
end

---Get config key of `lang`, which is configured in TOML
---@param lang string
---@return string
function M.config_key(lang)
    return M.conf.config[lang] or lang
end

--- Get default config of language from package `lspconfig`
--- @param key string
--- @return table
function M.config_of(key)
    local config_key = M.config_key(key)
    local mod = 'lspconfig/configs/' .. config_key
    return require(mod)
end

--- Get binary executable name from `lspconfig`'s default configuration'
--- @param key string
--- @return string
function M.cmd_of(key)
    local cmds = M.config_of(key).default_config.cmd
    local cmd = ''
    if #cmds == 0 then
        cmd = key
    else
        cmd = cmds[1]
    end
    return cmd
end

--- Get lsp server package name to download from `Mason`
--- @param key string
--- @return string
function M.pkg_of(key)
    local pkg = M.conf.pkg[key]
    return pkg or key
end

--- Config language
--- @param key string
--- @return function
function M.lang(key)
    return function(config)
        -- if enabled
        if M.conf.enable[key] then
            local config_key = M.config_key(key)
            local server = M.cmd_of(key)
            local pkg = M.pkg_of(key)

            -- if not installed in $PATH
            if not (vim.fn.executable(server) == 1) then
                vim.cmd('MasonInstall ' .. pkg)
            end

            -- setup with input config
            lspconfig[config_key].setup(config)
        end
    end
end

function M.setup()
    M.conf = M.read_conf() -- MUST read first!!!

    require("mason").setup {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        },
        PATH = "append"
    }
    require('lsp_signature').setup {}

    vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
            local mode = vim.api.nvim_get_mode().mode
            local filetype = vim.bo.filetype
            if vim.bo.modified == true and mode == 'n' and filetype ~= "oil" then
                vim.cmd('lua vim.lsp.buf.format()')
            else
            end
        end
    })

    M.lang('clang')(require('lsp/clang'))
    M.lang('lua')(require('lsp/lua'))
    M.lang('rust')(require('lsp/rust'))
    M.lang('python')(require('lsp/python'))
    M.lang('go')(require('lsp/go'))
    M.lang('latex')(require('lsp/latex'))
end

return M












-- -- enabled key => server-install-name
-- M.ensure_lsps = {
--     ['lua_ls']        = 'lua-language-server',
--     ['clangd']        = 'clangd',
--     ['rust_analyzer'] = 'rust-analyzer',
--     ['pylsp']         = 'python-lsp-server',
-- }


-- require("mason-lspconfig").setup({
--     -- -- A list of servers to automatically install if they're not already installed
--     -- ensure_installed = {
--     --     'pylsp',
--     --     'lua_ls',
--     --     -- "clangd",
--     -- },
-- })


-- require("mason-lspconfig").setup_handlers({
--     function (server_name)
--         require("lspconfig")[server_name].setup{}
--     end,
--     -- Next, you can provide targeted overrides for specific servers.
--
--     ["lua_ls"] = function ()
--         lspconfig.lua_ls.setup {
--             settings = {
--                 Lua = {
--                     diagnostics = {
--                         globals = { "vim" }
--                     }
--                 }
--             }
--         }
--     end,
--
--     ["clangd"] = function ()
--         lspconfig.clangd.setup {
--             init_options = {
--                 fallbackFlags = {'--std=c++20'}
--             },
--             -- cmd = {
--             --     "clangd",
--             --     "--header-insertion=never",
--             --     "--query-driver=/usr/bin/clang",
--             --     "--all-scopes-completion",
--             --     "--completion-style=detailed",
--             -- }
--         }
--     end,
--
--    ['rust_analyzer'] = function() end,
-- })

-- local signature_help = vim.lsp.buf.signature_help
--
-- ---@diagnostic disable-next-line: duplicate-set-field
-- vim.lsp.buf.signature_help = function()
--     local max_height = vim.fn.screenrow() == vim.o.scrolloff + 1 and vim.o.scrolloff - 1 or 8
--     return signature_help({
--         anchor_bias = 'above',
--         max_height = max_height,
--         max_width = math.floor(vim.o.columns * 0.4),
--     })
-- end
