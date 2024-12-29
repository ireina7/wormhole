local M = {}

M.banner = {
    '',
    '    ████▌█████▌█ ████████▐▀██▀    ',
    '  ▄█████ █████▌ █ ▀██████▌█▄▄▀▄   ',
    '  ▌███▌█ ▐███▌▌  ▄▄ ▌█▌███▐███ ▀  ',
    ' ▐ ▐██  ▄▄▐▀█   ▐▄█▀▌█▐███▐█      ',
    '   ███ ▌▄█▌  ▀  ▀██  ▀██████▌     ',
    '    ▀█▌▀██▀ ▄         ███▐███     ',
    '     ██▌             ▐███████▌    ',
    '     ███     ▀█▀     ▐██▐███▀▌    ',
    '     ▌█▌█▄         ▄▄████▀ ▀      ',
    '       █▀██▄▄▄ ▄▄▀▀▒█▀█           ',
    '',
}

M.shortcuts = {
    {
        icon = '∃ ',
        icon_hl = 'Title',
        desc = 'Find File ',
        desc_hl = 'String',
        key = 'f',
        --keymap = 'f',
        --key_hl = 'Number',
        --key_format = ' %s', -- remove default surrounding `[]`
        action = 'Telescope find_files'
    },
    {
        icon = 'λ ',
        icon_hl = 'Title',
        desc = 'Find Dotfiles ',
        key = 'd',
        action = 'edit ~/.config/nvim/init.lua'
    },
    {
        icon = 'Σ ',
        desc = 'New Buffer ',
        icon_hl = 'Title',
        key = 'b',
        key_format = ' %s', -- remove default surrounding `[]`
        action = 'enew'
    }
}

function M.setup()
    require("dashboard").setup {
        theme = 'hyper',
        config = {
            header = M.banner,
            shortcut = M.shortcuts,
        },
    }
end


return M
