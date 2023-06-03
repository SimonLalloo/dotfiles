require("lib.init")

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  -- if not awesome.startup then awful.client.setslave(c) end

  if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
    -- Prevent clients from being unreachable after screen count changes.
    awful.placement.no_offscreen(c)
  end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
  c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

-- Focus
client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- Rounded corners
-- client.connect_signal("manage", function(c)
--   if not c.maximized then
--     c.shape = function(cr, w, h)
--       gears.shape.rounded_rect(cr, w, h, 20)
--     end
--     -- if c.name == "polybar complete_gapless" then
--     --   c.shape = gears.shape.rectangle
--     -- end
--   end
-- end)
--
-- client.connect_signal("property::maximized", function(c)
--   if c.maximized then
--     c.shape = gears.shape.rectangle
--     c.border_width = false
--   else
--     c.shape = function(cr, w, h)
--       gears.shape.rounded_rect(cr, w, h, 20)
--     end
--   end
-- end)
--
-- client.connect_signal("property::fullscreen", function(c)
--   if c.fullscreen then
--     c.shape = gears.shape.rectangle
--   else
--     c.shape = function(cr, w, h)
--       gears.shape.rounded_rect(cr, w, h, 20)
--     end
--   end
-- end)
