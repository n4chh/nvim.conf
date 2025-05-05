return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			diagnostics = {
				float = {
					border = "rounded",
				},
			},
		},
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = {
					"cppdbg",
					"python",
					"delve",
				},
				handlers = {
					function(config)
						require("mason-nvim-dap").default_setup(config)
					end,
					-- c = function(config)
					-- 	config.adapters = {
					-- 		type = "executable",
					-- 		command= "/usr/bin/gdb",
					-- 	}
					-- end,
				},
			})
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("mason-nvim-dap").setup()
			local dap = require("dap")
			local wk = require("which-key")

			-- dap.adapters default_capabilities

			local dapui = require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end

			-- dap.listeners.before.event_terminated.dapui_config = function()
			-- 	dapui.close()
			-- end
			-- dap.listeners.before.event_exited.dapui_config = function()
			-- 	dapui.close()
			-- end
			dapui.setup()

			wk.add({ "<leader>du", dapui.toggle, desc = "UI" })
			wk.add({ "<leader>dc", dap.continue, desc = "Continue" })
			wk.add({ "<leader>ds", group = "Steps" })
			wk.add({ "<leader>dsi", dap.step_into, desc = "Step into" })
			wk.add({ "<leader>dso", dap.step_over, desc = "Step over" })
			wk.add({ "<leader>dsO", dap.step_out, desc = "Step out" })
		end,
	},
}
