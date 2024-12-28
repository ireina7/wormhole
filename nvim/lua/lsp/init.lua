local M = {}

local lspconfig = require('lspconfig')


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


function M.config_of(key)
    local mod = 'lspconfig/configs/' .. key
    return require(mod)
end

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

function M.pkg_of(key)
    local pkg = M.conf.pkg[key]
    return pkg or key
end

function M.lang(key)
    return function(config)
        -- if enabled
        if M.conf.enable[key] then
            local server = M.cmd_of(key)
            local pkg = M.pkg_of(key)

            -- if not installed in $PATH
            if not (vim.fn.executable(server) == 1) then
                vim.cmd('MasonInstall ' .. pkg)
            end

            -- setup with input config
            lspconfig[key].setup(config)
        end
    end
end

function M.setup()
    M.conf = M.read_conf()

    require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        },
        PATH = "append"
    })

    M.lang('clangd')(require('lsp/clangd'))
    M.lang('lua_ls')(require('lsp/lua'))
    M.lang('rust_analyzer') {}
    M.lang('pylsp') {}
    M.lang('gopls')(require('lsp/go'))
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

