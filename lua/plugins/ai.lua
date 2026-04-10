vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  -- Dependencies
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/yetone/avante.nvim",
})
require("avante").setup({
  provider = "claude-code",

  providers = {
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-sonnet-4-6",
      timeout = 30000,
      extra_request_body = {
        temperature = 0.75,
        max_tokens = 32000,
      },
    },
  },
  acp_providers = {
	["claude-code"] = {
      command = "npx",
      args = { "@zed-industries/claude-code-acp" },
      env = {
        NODE_NO_WARNINGS = "1",
        ANTHROPIC_API_KEY = os.getenv("ANTHROPIC_API_KEY"),
      },
    },
    ["kiro"] = {
      command = os.getenv("HOME") .. "/.local/bin/kiro-cli",
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