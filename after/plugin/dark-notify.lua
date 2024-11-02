local dn = require('dark_notify')

-- Configure
dn.run({
    schemes = {
      dark = {
	      background = "dark"
      },
      light = {
	      background = "light",
      },
    },
})

