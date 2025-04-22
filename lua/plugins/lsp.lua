return {
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
		end,
	},
}
