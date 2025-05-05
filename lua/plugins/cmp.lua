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
			lsp_doc_border = true,
		},
	},
}
