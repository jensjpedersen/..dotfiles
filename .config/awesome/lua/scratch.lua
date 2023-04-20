



awful = require("awful")
naughty = require("naughty")
gears = require("gears")


local screen_name = 'LVDS-1'
local function create_scratch(name, cmd)

    -- TODO: check if already exists 
    os.execute("pkill -f \"alacritty --class " .. name .. " -e " .. cmd .. '"')


    awful.tag.add(name, {
        layout = awful.layout.suit.floating,
        hide = true,
        screen = awful.screen.focused()
    })

    table.insert(awful.rules.rules, 
    { rule = { class = name },
        properties = {
            tag = name,
            screen = screen_name,
            floating = true,
            width = 1700,
            height = 800,
            callback = function(c)
                      awful.placement.centered(c, {honor_workarea=true})
                  end
            } }
        )

    awful.spawn.with_shell("alacritty --class " .. name .. " -e " .. cmd)
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










