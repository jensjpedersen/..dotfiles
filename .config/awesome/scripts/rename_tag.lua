
local awful = require("awful")
local naughty = require("naughty")

local t = awful.screen.focused().selected_tag

if t then

    -- grep first digits from tag ^%d+
    local tag_nr = string.match(t.name, "^%d+")
    --
    -- dmenu prompt
    local command = 'echo "" | dmenu -p "Rename tag:" -i -nf "#fbf1c7" -nb "#282828" -sb "#282828" -sf "#fbf1c7" -h 40 -fn "MesloLGL Nerd Font Mono-13"'


    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()

    if result == "\n" then
        t.name = tag_nr
    else
        t.name = tag_nr .. ':' .. result
    end


end
