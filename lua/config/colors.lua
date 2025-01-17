-- Lua
local cfg = vim.g.onedark_config
require('onedark').setup  {
    -- Main options --
    style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = '<leader>ts', -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    -- toggle_style_list = {'darker','light'}, -- List of styles to toggle between
    toggle_style_list = {'darker'}, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    -- Lualine options --
    lualine = {
        transparent = false, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {
		green = "#9fef00",
		bright_green = "#c5f467",
		white = "#ffffff",
		bright_white = "#c5d1eb",
		black = "#000000",
		bright_black = "#666666",
		red = "#ff3e3e",
		bright_red = "#ff8484",
		blue = "#2e6cff",
		bright_blue = "#5cb2ff",
		yellow = "#ffaf00",
		bright_yellow = "#ffcc5c",
		purple = "#9f00ff",
		bright_purple = "#cf8dfb",
		cyan = "#2ee7b6",
		bright_cyan = "#5cecc6",
		fg = "#a4b1cd",
		bg0 = "#1a2332",
		bg1 = "#1a2332",
		bg2 = "#1a2332",
		bg3 = "#2a3342",
		bg_d = "#1a2332",

	}, -- Override default colors
    highlights = {
		["@function"] = {fg = '$bright_blue'},
		["@function.builtin"] = {fg = '$bright_blue'},
		["@function.macro"] = {fg = '$bright_blue'},
		["@function.method"] = {fg = '$bright_blue'},
		["@keyword"] = {fg = '$bright_red'},
		["@keyword.directive"] = {fg = '$bright_red'},
		["@keyword.exception"] = {fg = '$bright_red'},
		["@keyword.function"] = {fg = '$bright_red'},
		["@keyword.import"] = {fg = '$bright_red'},
		["@keyword.conditional"] = {fg = '$bright_red'},
		["@keyword.operator"] = {fg = '$bright_red'},
		["@keyword.repeat"] = {fg = '$bright_red'},
		["@lsp.type.parameter"] = {fg = '$bright_purple'},
		["@lsp.type.keyword"] = {fg = '$bright_purple'},
		["@lsp.typemod.variable.defaultLibrary"] = {fg = '$yellow'},
		["@lsp.typemod.method.defaultLibrary"] = {fg = '$bright_blue'},
		["@lsp.typemod.function.defaultLibrary"] = {fg = '$bright_blue'},
		["@lsp.type.method"] = {fg = '$bright_blue'},
		["@lsp.type.functions"] = {fg = '$bright_blue'},

	}, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
}
require('onedark').load()

