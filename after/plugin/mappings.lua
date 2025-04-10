vim.g.mapleader = ' '
local dap = require('dap')
local dapui = require('dapui')
local wk = require("which-key")
-- Ventanas y buffers
wk.add({
	{
		"<leader>b",
		group = "Buffers",
		expand = function()
			return require("which-key.extras").expand.buf()
		end,
	},
	-- Debugs

	{ "<leader>d",  group = "Depuración" },
	-- {"<leader>dr", ,desc = "Iniciar depuración"},
	{ "<leader>dsi",       dap.step_into,           desc = "Step into" },
	{ "<leader>dso",       dap.step_over,           desc = "Step over" },
	{ "<leader>dsO",     dap.step_out,            desc = "Step out" },
	{ "<leader>db",     dap.toggle_breakpoint,   desc = "Breakpoint" },
	{ "<leader>dc",     dap.continue,                 desc = "Continue" },
	{ "<leader>dR",     dap.run_to_cursor,       desc = "Run to cursor" },
	{ "<leader>dt", dap.terminate, desc = "Terminate session"},
	{ "<leader>du",  group = "Interfaz" },
	{ "<leader>dut",       dapui.toggle,            desc = "Mostrar/Ocultar interfaz de depuracion" },
	-- { "<leader>dus",       dap.step_into,           desc = "Scopes" },
	-- { "<leader>duT",       dap.step_into,           desc = "threads" },
	--

	-- Errores
	{ "<leader>e",  group = "Diagnósticos" },
	{ "<leader>ef", vim.diagnostic.open_float, desc = "Mostrar diagnóstico." },
	-- Después de nvim 10, K se habilitó por defecto al hover del
	-- lsp.
	{ "[b",         "<cmd>bp<cr>",             desc = "Buffer anterior" },
	{ "]b",         "<cmd>bn<cr>",             desc = "Buffer posterior" },
	{ "<leader>W",  proxy = "<c-w>",           group = "windows" }, -- proxy to window mappings
	{
		mode = { "n", "v" },                           -- NORMAL and VISUAL mode
		{ "<leader>q", "<cmd>q<cr>",                   desc = "Cerrar ventana" },
		{ "<leader>w", "<cmd>w<cr>",                   desc = "Guardar" },
		{ "<leader>c", ":bp<bar>sp<bar>bn<bar>bd<CR>", desc = "Cerrar Buffer" },
	}
}
)
