


awful = require("awful")
naughty = require("naughty")
local screen = awful.screen.focused()
local clients = screen.clients or {}
for i = #clients, 1, -1 do
    local c = clients[i]
    c:move_to_screen()
end

