--[[
    This is the main config file for my Awesome WM config.
    Better docs for everything are in my Obsidian vault.
--]]

require("lib.init")         -- The base imports
require("lib.startupError") -- Show errors if the config doesn't compile

local theme_path = gears.filesystem.get_configuration_dir() .. "themes/"
-- beautiful.init(theme_path .. "gruvbox/theme.lua")
beautiful.init(theme_path .. "gruvbox/theme_gapless.lua")

require("lib.variables")    -- Basic variables & layouts
require("lib.menu")         -- The 'right click' menu
require("lib.keys")         -- keybindings
require("lib.rules")        -- Rules for different apps and windows, etc.
require("lib.signals")      -- Different triggers
require("lib.autostart")    -- Autorun apps
