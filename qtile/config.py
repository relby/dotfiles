from typing import List  # noqa: F401

from modules.groups import floating_layout, groups, layouts
from modules.keymaps import keys, mouse
from modules.statusbar import extension_defaults, screens, widget_defaults

from libqtile import hook
import os
import subprocess

@hook.subscribe.startup_once
def autostart():
    subprocess.call([os.path.expanduser("~/.config/qtile/autostart.sh")])

auto_fullscreen = True
auto_minimize = False
bring_front_click = False
cursor_warp = False

dgroups_app_rules = []  # type: List
dgroups_key_binder = None
dpi_scale = 1.0

focus_on_window_activation = "smart"
follow_mouse_focus = True
reconfigure_screens = True

wmname = "qtile"
