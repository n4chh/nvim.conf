local dn = require('dark_notify')

-- Configure
dn.run({
    schemes = {
      dark = {
		  colorscheme = "onedark",
		  background = "dark"
      },
      light = {
		  colorscheme = "onedark",
		  background = "light",

      },
    },
	onchange = require'onedark'.toggle
})

