require("lib.init")

awful.spawn("picom")
awful.spawn("dunst -print")
-- awful.spawn("polybar complete")
awful.spawn("polybar complete_gapless")
awful.spawn("xscreensaver --no-splash")
