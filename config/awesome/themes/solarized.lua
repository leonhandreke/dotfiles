-- Hacky script to set the font on the solarized dark theme object
local awful = require("awful")
theme = dofile(awful.util.getdir("config") .. "/themes/awesome-solarized/dark/theme.lua")
theme.font = "sans 8"
return theme
