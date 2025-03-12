local dn = require('dark_notify')

-- Configure
dn.run({
    schemes = {
      dark = {
		  colorscheme = "github_dark",
		  background = "dark"
      },
      light = {
		  colorscheme = "github_light",
		  background = "light",

      },
    },
	-- onchange = require'onedark'.toggle
})

