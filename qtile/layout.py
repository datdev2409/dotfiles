from libqtile import layout
from themes import colors

my_layout = [
    layout.Columns(
        margin = 3,
        border_width = 3,
        border_focus = colors["red"],
        border_normal = colors["bg"],
    ), 

    # layout.Max(margin = 6),
    # layout.MonadWide(),

    layout.Stack(
        margin = 3,
        num_stacks = 1,
        border_width = 3,
        border_focus = colors["red"]
    ),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]
