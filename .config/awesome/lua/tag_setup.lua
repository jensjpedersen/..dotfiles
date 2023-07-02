local naughty = require("naughty")
local awful = require("awful")
local gears = require("gears")


sort_order = {
    ['LVDS-1'] = 1,
    ['DP-2'] = 2,
}

-- Save screen objects in table
local function get_screens()
    -- Returns: 
    --  table of available screens, key = screen_name, value = awesome screen object
    local screens = {}
    for s in screen do
        for k, _ in pairs(s.outputs) do
            screens[k] = s
        end
    end

    return screens

end

local function sort_table(tbl, ref_tbl)
    -- Parameters: 
    --   tbl: { ['screen_name'] = priority, ... }
    --         priority (float): Elements is sorted with respect to priority 
    --   ref_tbl: { ['screen_name'] = screen_tbl }
    --         screen_tbl: awesome wm screen object 

    -- Create a temporary table to hold the keys of tbl
    local keys = {}

    -- Populate the temporary table with the keys of tbl
    for k, _ in pairs(tbl) do
        table.insert(keys, k)
        naughty.notify({text = tostring(k)})
    end

    -- Define a comparison function that compares the values in ref_tbl
    local function compare(a, b)
        return ref_tbl[a] < ref_tbl[b]
    end

    -- Sort the keys table based on the values in ref_tbl
    table.sort(keys, compare)

    -- Create the new_tbl table by iterating over the sorted keys table
    local new_tbl = {}
    for i, k in ipairs(keys) do
        new_tbl[i] = tbl[k]
    end


    return new_tbl
end


local function tag_keybinding_setup(tagkeys)
    -- Parameters:
    --  tagkeys - ordered table
    --      [1]  = { 'Mod4',  "y",   screens[1]},
    --      [2]  = { 'Mod4',  "u",   screens[1]},
    --      [3]  = { 'Mod4',  "i",   screens[1]},
    --      tag      modkey    key      screen 
    --
    --  screen_tbl - ordered table
    --      [1] = screen1
    --      [2] = screen2
    -- screen order  awesome screen object 

    for k, v in pairs(tagkeys) do
    -- for i, k in ipairs(tagkeys) do
        globalkeys = gears.table.join(globalkeys,
            -- View tag only.
            awful.key({ v[1] }, v[2],
                      function ()
                            -- local screen = awful.screen.focused()
                            local screen = v[3]
                            local tag = screen.tags[k]
                            if tag then
                               tag:view_only()
                               awful.screen.focus(screen)
                            end
                      end,
                      {description = "view tag #"..k, group = "tag"}),
            -- Toggle tag display.
            awful.key({ v[1], "Control" }, v[2],
                      function ()
                          -- local screen = awful.screen.focused()
                          local screen = v[3]
                          local tag = screen.tags[k]
                          if tag then
                             awful.tag.viewtoggle(tag)
                          end
                      end,
                      {description = "toggle tag #" .. k, group = "tag"}),
            -- Move client to tag.
            awful.key({ v[1], "Shift" }, v[2],
                      function ()
                          if client.focus then
                              client.focus:move_to_tag(v[3].tags[k])

                              -- local tag = client.focus.screen.tags[k]
                              -- if tag then
                              --     -- client.focus:move_to_tag(tag)
                              -- end
                         end
                      end,
                      {description = "move focused client to tag #"..k, group = "tag"}),
            -- TODO: not fixed for multi monitor
            -- Toggle tag on focused client.
            awful.key({ v[1], "Control", "Shift" }, v[2],
                      function ()
                          if client.focus then
                              local tag = client.focus.screen.tags[k]
                              if tag then
                                  client.focus:toggle_tag(tag)
                              end
                          end
                      end,
                      {description = "toggle focused client on tag #" .. k, group = "tag"})
        )
    end

    root.keys(globalkeys)


end


local function tag_setup()
    -- Get active screens
    local screens = get_screens()

    -- Sort screens with respect to table of pirorities
    local sorted_screens = sort_table(screens, sort_order)

    -- Get number of connected screens
    local n = 0
    for _ in pairs(screens) do n = n + 1 end


    -- My tag setup always require 2 "screens"
    if n == 1 then
        table.insert(sorted_screens, 2, sorted_screens[1])
    end

    -- Configure tag navigation 
    local tagkeys = {
        [1]  = { 'Mod4',  "y",   sorted_screens[1]},
        [2]  = { 'Mod4',  "u",   sorted_screens[1]},
        [3]  = { 'Mod4',  "i",   sorted_screens[1]},
        [4]  = { 'Mod4',  "o",   sorted_screens[1]},
        [5]  = { 'Mod4',  "p",   sorted_screens[1]},
        [6]  = { 'Mod4',  "6", sorted_screens[2]},
        [7]  = { 'Mod4',  "7", sorted_screens[2]},
        [8]  = { 'Mod4',  "8", sorted_screens[2]},
        [9]  = { 'Mod4',  "9", sorted_screens[2]},
        [10] = { 'Mod4',  "0", sorted_screens[2]},
        [11] = {     '', "F1",   sorted_screens[1]},
        [12] = {     '', "F2",   sorted_screens[1]},
        [13] = {     '', "F3",   sorted_screens[1]},
        [14] = {     '', "F4",   sorted_screens[1]},
        [15] = {     '', "F5",   sorted_screens[1]},
        [16] = {     '', "F6",   sorted_screens[1]},
        [17] = {     '', "F7",   sorted_screens[1]},
    }

    tag_keybinding_setup(tagkeys)
end

-- TODO: callback
tag_setup()

-- awful.screen.connect_for_each_screen(function(s) tag_setup() end)










