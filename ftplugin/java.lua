local config = {
	..., -- not valid Lua, this is a placeholder for your other properties.
	cmd = {
		vim.fn.expand '$HOME/.local/share/nvim/mason/bin/jdtls'
	},
	root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),
	init_options = {
		bundles = {
			vim.fn.glob(vim.fn.expand "$HOME/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", 1)
		},
	},
	settings = {
		java = {
			configuration = {
				-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
				-- And search for `interface RuntimeOption`
				-- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above

				runtimes = {
					{
						name = "JavaSE-24",
						path = "/usr/lib/jvm/java-24-openjdk/",
					},
					{
						name = "JavaSE-21",
						path = "/usr/lib/jvm/java-21-openjdk/",
					},
					{
						name = "JavaSE-17",
						path = "/usr/lib/jvm/java-17-openjdk/",
					},
				}
			}
		}
	}
}



require('jdtls').start_or_attach(config)
