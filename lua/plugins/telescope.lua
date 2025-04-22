return {
    'nvim-telescope/telescope.nvim',
    -- tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require("telescope")
        require("telescope").setup {
            pickers = {
                colorscheme = {
                    enable_preview = true
                }
            }
        }
        telescope.load_extension("noice")
    end
}
