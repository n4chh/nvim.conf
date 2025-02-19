local dn = require('dark_notify')

-- Configure
dn.run({
    schemes = {
      dark = {
		  colorscheme = "vscode",
		  background = "dark"
      },
      light = {
		  colorscheme = "vscode",
		  background = "light",

      },
    },
	-- onchange = require'onedark'.toggle
})

