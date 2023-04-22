
-- Move foucsed client to master and cycle clients to the right

local awful = require("awful")

local client_info = awful.client.idx(client.focus)
local current_sum = client_info['col'] + client_info['idx']

local count = 0
tag = awful.screen.focused().selected_tag
for _, c in ipairs(tag:clients()) do
    local info = awful.client.idx(c)
    local sum = info['col'] + info['idx']

    if sum < current_sum then
        count = count + 1
    end

end

local c = client.focus
for i = 1, count do
    awful.client.swap.byidx(-1, c)
end


