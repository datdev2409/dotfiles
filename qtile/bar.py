from libqtile import bar, widget
from themes import colors
from libqtile.lazy import lazy

size = 32

color_fg = colors["fg"]
color_bg = colors["bg"]
color_active = colors["blue"]

font = "Ubuntu Mono Nerd Font Bold"
font_size = 18
padding = 15

defaults_config = dict(
    font = font,
    fontsize = font_size,
    foreground = color_fg,
    background = color_bg,
    padding = padding
)

groupBox_config = dict(
    margin_y = 5,
    padding = 10,
    active = color_fg,
    this_current_screen_border = color_active,
    hide_unused = True,
    highlight_method='text',
)

layoutName_config = dict (
    fmt = ': {} :',
    foreground = colors["purple"]
)

windowName_config = dict(
    max_chars=26,
    fmt='{}',
    format='{name}',
)

backlight_conifg = dict(
    fmt = 'Bri: {}',
    backlight_name = "intel_backlight",
    foreground = colors["yellow"]
)

volume_config = dict(
    fmt = "Vol: {}",
    foreground = colors["cyan"]
)

wlan_config = dict(
    format='  {essid}',
    foreground = colors["orange"],
    update_interval=3,
    mouse_callbacks = {'Button1': lazy.spawn("kitty -e nmtui")},
)

battery_config = dict(
    format = 'Bat: {percent:2.0%}',
    low_foreground = colors["red"],
    foreground = colors["green"],
    update_interval=120,
)

clock_config = dict(
    format="%I:%M %p",
    foreground = color_active,
    mouse_callbacks = {'Button1': lazy.spawn("kitty -e calcurse")},
)

top_bar = bar.Bar([
    widget.GroupBox(**groupBox_config),
    widget.CurrentLayout(**layoutName_config),
    widget.WindowName(**windowName_config),

    widget.Prompt(),
    widget.Backlight(**backlight_conifg),
    widget.Volume(**volume_config),
    widget.Battery(**battery_config),
    widget.Wlan(**wlan_config),
    widget.Clock(**clock_config)
], size)

