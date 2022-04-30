local logger = require("utils.logger")

-- {{ hooks
logger.info('initializing hooks')
require('hooks.error')
require('hooks.theme')
require('hooks.layouts')
require('hooks.screen')
require('hooks.keyboard')
require('hooks.binds')
require('hooks.focus')
require('hooks.signals')
require('hooks.rules')
require('hooks.titlebars')
logger.info('all hooks has been initialized!')
-- }}}
