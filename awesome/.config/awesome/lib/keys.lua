require("lib.init")
require("lib.variables")

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

globalkeys = gears.table.join(
    -- ===== System controls =====
    -- Keyboard layout
    awful.spawn.once("setxkbmap -layout 'us, se' -option ctrl:nocaps"),
    awful.key({ "Shift" }, "Alt_L", function () mykeyboardlayout.next_layout(); end,
              {description="Toggle US / SE layout", group="awesome"}),
   -- Brightness
    awful.key({ }, "XF86MonBrightnessDown", function ()
        awful.util.spawn("light -U 5") end,
        {description="Lower display brightness", group="awesome"}),
    awful.key({ }, "XF86MonBrightnessUp", function ()
        awful.util.spawn("light -A 5") end,
        {description="Raise display brightness", group="awesome"}),
    -- Volume
    awful.key({}, "XF86AudioRaiseVolume", function() 
        awful.util.spawn("pactl set-sink-volume @DEFAULT_SINK@ +2%") end,
        {description="Raise volume", group="awesome"}),
    awful.key({}, "XF86AudioLowerVolume", function()
        awful.util.spawn("pactl set-sink-volume @DEFAULT_SINK@ -2%") end,
    {description="Lower volume", group="awesome"}),
    awful.key({}, "XF86AudioMute", function()
        awful.util.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle") end,
    {description="Mute", group="awesome"}),

    -- Restart Awesome
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    -- Log out
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    -- Lock
    awful.key({ modkey,           }, "q", function () awful.spawn("xscreensaver-command -lock") end,
              {description = "lock", group = "awesome"}),



    -- ===== Launch stuff =====
    -- Help menu
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    -- Switch to app
    -- TODO: Figure out why using the launch scripts doesn't work
    -- awful.key({ modkey }, "r", function () awful.util.spawn("~/.config/rofi/launchers/type-1/launcher.sh") end,
    awful.key({ modkey }, "r", function () awful.spawn("rofi -show window -theme ~/.config/rofi/launchers/type-1/style-8.rasi") end,
              {description = "App switcher", group = "launcher"}),
    -- Start app
    awful.key({ modkey }, "p", function() awful.spawn("rofi -show drun -theme ~/.config/rofi/launchers/type-1/style-8.rasi") end,
              {description = "App launcher", group = "launcher"}),
    -- Start terminal
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    -- Screenshot
    awful.key({ modkey, "Control"     }, "u", function () awful.spawn("flameshot gui") end,
              {description = "Screenshot", group = "launcher"}),
    -- Open menu
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
        {description = "show main menu", group = "awesome"}),



    -- ===== Layouts =====
    -- Switch between windows
    awful.key({ modkey,           }, "j", function () 
        awful.client.focus.byidx( 1) end,
        {description = "focus next by index", group = "client"}),
    awful.key({ modkey,           }, "k", function () 
        awful.client.focus.byidx(-1) end,
        {description = "focus previous by index", group = "client"}),
    -- Switch to previous window
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),
    -- Move windows
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    -- Go to urgent window
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    -- Resize focused window
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),



    -- ===== Workspaces =====
    -- Move between workspaces
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    -- Go to previous workspace
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    -- Switch screen
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),



    -- ===== I don't know ===== #TODO
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"})
)

clientkeys = gears.table.join(
    -- fullscreen
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

-- ===== Mouse buttons =====
clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Actually set the keys
root.keys(globalkeys)
