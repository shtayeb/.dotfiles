local Config = require('config')
-- require('events.right-status').setup()
require('events.tab-title').setup()
-- require('events.new-tab-button').setup()

local config = Config:init()
   :append(require('config.appearance'))
   -- :append(require('config.bindings'))
   :append(require('config.domains'))
   :append(require('config.fonts'))
   :append(require('config.general'))
   :append(require('config.launch'))

return config.options