import os, subprocess
from libqtile import bar, layout, widget, hook
from libqtile.lazy import lazy
from libqtile.config import Click, Drag, Group, Key, Match, Screen

import themes
from bar import top_bar, defaults_config 
from layout import my_layout

terminal = "kitty"

# ----------------------------
# -------- Hotkeys -----------
# ----------------------------
mod = "mod4"
keys = [

    # Layout hotkeys
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "Tab", lazy.layout.next()),

    # Window hotkeys
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),

    Key([mod, "control"], "h", lazy.layout.grow_left()),
    Key([mod, "control"], "l", lazy.layout.grow_right()),
    Key([mod, "control"], "j", lazy.layout.grow_down()),
    Key([mod, "control"], "k", lazy.layout.grow_up()),

    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "f", lazy.window.toggle_fullscreen()),

    # Application hotkeys
    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod], "b"     , lazy.spawn("google-chrome-stable")),

    Key([mod], "space", lazy.next_layout()),
    Key([mod], "q", lazy.window.kill()),
    Key([mod], "r", lazy.spawncmd()),

    # Command hotkeys
    Key([mod, "shift"], "q", lazy.shutdown()),
    Key([mod, "shift"], "r", lazy.reload_config()),

    # Media hotkeys
    Key([], 'XF86AudioMute'         , lazy.spawn('pulseaudio-ctl set 1')),
    Key([], 'XF86AudioRaiseVolume'  , lazy.spawn('pulseaudio-ctl up 5')),
    Key([], 'XF86AudioLowerVolume'  , lazy.spawn('pulseaudio-ctl down 5')),

    Key([], 'XF86MonBrightnessUp'   , lazy.spawn('light -A 10')),
    Key([], 'XF86MonBrightnessDown' , lazy.spawn('light -U 10')),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),

            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )

widget_defaults = defaults_config
layouts = my_layout

screens = [
    Screen(top = top_bar)
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False

# floating_layout = layout.Floating(
#     float_rules=[
#         # Run the utility of `xprop` to see the wm class and name of an X client.
#         *layout.Floating.default_float_rules,
#         Match(wm_class="confirmreset"),  # gitk
#         Match(wm_class="makebranch"),  # gitk
#         Match(wm_class="maketag"),  # gitk
#         Match(wm_class="ssh-askpass"),  # ssh-askpass
#         Match(title="branchdialog"),  # gitk
#         Match(title="pinentry"),  # GPG key password entry
#     ]
# )

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

wmname = "LG3D"


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])
