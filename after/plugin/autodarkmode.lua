local adm = require('auto-dark-mode')


adm.setup({
    set_dark_mode = function()
        vim.api.nvim_set_option_value("background", "dark", {})
		vim.cmd('colorscheme kanagawa')
    end,
    set_light_mode = function()
        vim.api.nvim_set_option_value("background", "light", {})
		vim.cmd('colorscheme kanagawa-lotus')
    end,
    update_interval = 3000,
    fallback = "dark"
})
