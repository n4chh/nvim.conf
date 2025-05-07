return {
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				border = "rounded",
			},
		},
	},
	{
		"saghen/blink.cmp",
		opts = {
			completion = {
				menu = {
					border = "rounded",
					winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
				},
				documentation = {
					window = {
						border = "rounded",
					},
				},
			},
		},
	},
	{
		"folke/noice.nvim",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			presets = {
				lsp_doc_border = true,
			},
		},
	},
}
