awful = require("awful")
naughty = require("naughty")
gears = require("gears")


--{{ Scratchpad
local function create_scratch(name, cmd)
    os.execute("pkill -f \"alacritty --class " .. name .. " -e " .. cmd .. '"')

    awful.tag.add(name, {
      layout = awful.layout.suit.floating,
      hide = true,
    })

    local tag = awful.tag.find_by_name(awful.screen.focused(), name)

    table.insert(awful.rules.rules,
    { rule_any = { instance = { name } },
        properties = { placement = awful.placement.centered , floating = true, ontop = true, border_width = 1,
        tag = tag, width=1600, height=800, x=0, y=0, opacity=0.5, focus=true, focusable=true
        } }
    )
    awful.spawn("alacritty --class " .. name .. " -e " .. cmd)
end

local function toggle_scratch(name)
    local screen = awful.screen.focused()
    local tag = awful.tag.find_by_name(awful.screen.focused(), name)
    if tag then
        local clients = tag:clients()
        for _, c in ipairs(clients) do
            if c.instance == name then
                c:raise()
                client.focus = c
                break
            end
        end
        awful.tag.viewtoggle(tag)
    end

end

create_scratch('mixer', 'pulsemixer')
create_scratch('btop', 'btop')
create_scratch('ranger', 'ranger')
create_scratch('terminal', 'zsh')

globalkeys = gears.table.join(globalkeys,
    awful.key({ "Mod4" }, "plus", function() toggle_scratch("mixer") end),
    awful.key({ "Mod4" }, "aring", function() toggle_scratch("btop") end),
    awful.key({ "Mod4" }, "ae", function() toggle_scratch("ranger") end),
    awful.key({ "" }, "F12", function() toggle_scratch("terminal") end)
    )

root.keys(globalkeys)
--}}



