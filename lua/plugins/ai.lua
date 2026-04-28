vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  -- Dependencies
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/yetone/avante.nvim",
})
require("avante").setup({
  highlights = {
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
},
  provider = "claude-code",

  acp_providers = {
    ["kiro-acp"] = {
      command = os.getenv("HOME") .. "/.toolbox/bin/kiro-cli",
      args = { "acp" },
    },
  },
  behaviour = {
    auto_focus_sidebar = true,
    auto_suggestions = false,       -- saves tokens, trigger manually
    auto_apply_diff_after_generation = false, -- always review before applying
    minimize_diff = true,
  },

  -- Project-specific instructions (like CLAUDE.md)
  instructions_file = "avante.md",
})

vim.api.nvim_set_hl(0, "AvanteToBeDeletedWOStrikethrough", { link = "DiffDelete" })
