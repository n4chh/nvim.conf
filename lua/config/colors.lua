-- Lua
require('mini.icons').setup()
require('monokai-pro').setup()
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
-- require('onedark').load()

local c = require('vscode.colors').get_colors()
require('vscode').setup({
    -- Alternatively set style in setup
    -- style = 'light'

    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    italic_comments = true,

    -- Underline `@markup.link.*` variants
    underline_links = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = '#FFFFFF',
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})
-- require('vscode').load()



-- Default options
require('github-theme').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath('cache') .. '/github-theme',
    compile_file_suffix = '_compiled', -- Compiled file suffix
    hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
    hide_nc_statusline = true, -- Override the underline style for non-active statuslines
    transparent = false,       -- Disable setting bg (make neovim's background transparent)
    -- transparent = true,       -- Disable setting bg (make neovim's background transparent)
    terminal_colors = true,    -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,      -- Non focused panes set to alternative background
    module_default = true,     -- Default enable value for modules
    styles = {                 -- Style to be applied to different syntax groups
      comments = 'NONE',       -- Value is any valid attr-list value `:help attr-list`
      functions = 'BOLD',
      keywords = 'BOLD',
      variables = 'NONE',
      conditionals = 'NONE',
      constants = 'NONE',
      numbers = 'NONE',
      operators = 'NONE',
      strings = 'NONE',
      types = 'NONE',
    },
    inverse = {                -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    darken = {                 -- Darken floating windows and sidebar-like windows
      floats = true,
      sidebars = {
        enable = true,
        list = {},             -- Apply dark background to specific windows
      },
    },
    modules = {                -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {},
})

-- setup must be called before loading
-- vim.cmd('colorscheme github_light')
