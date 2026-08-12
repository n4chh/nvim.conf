vim.pack.add({
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/rcarriga/nvim-dap-ui",
	"https://github.com/nvim-neotest/nvim-nio", -- dap-ui dependency
})

local dap = require("dap")
local dapui = require("dapui")

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
		args = { "--port", "${port}" },
	},
}

-- Telescope over the executables in zig-out, picking the ELF lldb reads
-- symbols from. nvim-dap resumes the coroutine with the value we hand it.
local function pick_symbols()
	return coroutine.create(function(coro)
		local fd = vim.fn.executable("fd") == 1 and "fd" or "fdfind"
		require("telescope.pickers").new({}, {
			prompt_title = "Symbols",
			finder = require("telescope.finders").new_oneshot_job({ fd, "--type", "x", ".", "zig-out" }, {}),
			sorter = require("telescope.config").values.generic_sorter({}),
			attach_mappings = function(bufnr)
				require("telescope.actions").select_default:replace(function()
					require("telescope.actions").close(bufnr)
					local entry = require("telescope.actions.state").get_selected_entry()
					local path = vim.fn.fnamemodify(entry[1], ":p")
					coroutine.resume(coro, { ("target create %q"):format(path) })
				end)
				return true
			end,
		}):find()
	end)
end

-- `zig build debug` compiles and starts the guest; this only attaches.
dap.configurations.zig = {
	{
		name = "Attach to QEMU :1234",
		type = "codelldb",
		request = "attach",
		targetCreateCommands = pick_symbols,
		processCreateCommands = { "gdb-remote localhost:1234" },
	},
}
dap.configurations.c = dap.configurations.zig
dap.configurations.asm = dap.configurations.zig

dapui.setup()
dap.listeners.after.event_initialized["dapui"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui"] = function() dapui.close() end

-- sign text must be non-empty or the sign is never placed and breakpoints
-- silently stop working; nr2char keeps the glyphs intact
local icon = function(cp) return vim.fn.nr2char(cp, 1) end
vim.fn.sign_define("DapBreakpoint", { text = icon(0xf111), texthl = "DiagnosticSignError" })
vim.fn.sign_define("DapStopped", { text = icon(0xf04b), texthl = "DiagnosticSignWarn", linehl = "Visual" })

vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: attach / continue" })
-- detach, not terminate: terminate tries to kill the process and hangs on a stub
vim.keymap.set("n", "<S-F5>", function() dap.disconnect({ terminateDebuggee = false }) end,
	{ desc = "Debug: detach (guest keeps running)" })
vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "Debug: toggle breakpoint" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: step over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: step into" })
vim.keymap.set("n", "<S-F11>", dap.step_out, { desc = "Debug: step out" })
vim.keymap.set("n", "<F12>", dapui.toggle, { desc = "Debug: toggle UI" })
vim.keymap.set("n", "<F8>", dap.repl.toggle, { desc = "Debug: toggle lldb REPL" })
