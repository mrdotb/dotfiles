 -- =============================================================================
 --                         _       _   _             _
 --       _ __ ___  _ __ __| | ___ | |_| |__   __   _(_)_ __ ___  _ __ ___
 --      | '_ ` _ \| '__/ _` |/ _ \| __| '_ \  \ \ / / | '_ ` _ \| '__/ __|
 --      | | | | | | | | (_| | (_) | |_| |_) |  \ V /| | | | | | | | | (__
 --      |_| |_| |_|_|  \__,_|\___/ \__|_.__/    \_/ |_|_| |_| |_|_|  \___|
 -- =============================================================================

-- Install plugins
require('plugins.install')

-- Load plugins config
require('plugins.config')

-- Basic editor options
require('user.settings')

-- Load keymaps
require('user.keymaps')

-- Load filetype
require('user.filetype')
