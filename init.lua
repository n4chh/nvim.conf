if vim.g.vscode then
	require("vscode_settings")
else
	require("pre_lazy_opts")
	require("config")
	require("post_lazy_opts")
	require("auto")
end
