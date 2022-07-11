from libqtile.command import lazy
from libqtile.config import EzClick, EzDrag, EzKey
from os.path import expanduser
# Default applications
myTerminal = "alacritty"
myBrowser = "brave"

EzKey.modifier_keys = {
    "M": "mod4",
    "A": "mod1",
    "S": "shift",
    "C": "control",
    "H": "mod3",
}

# Drag floating layouts.
mouse = [
    EzDrag(
        "M-<Button1>",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    EzDrag(
        "M-<Button3>", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    EzClick("M-<Button2>", lazy.window.bring_to_front()),
]

group_navigation = [
    EzKey("M-<Tab>", lazy.screen.next_group()),
    EzKey("M-S-<Tab>", lazy.screen.prev_group()),
]

window_navigation = [
    EzKey("M-h", lazy.layout.left()),
    EzKey("M-j", lazy.layout.down()),
    EzKey("M-k", lazy.layout.up()),
    EzKey("M-l", lazy.layout.right()),
]

window_displacement = [
    EzKey("A-<Tab>", lazy.layout.next()),  # Shift focus -> other window(s) in stack
    EzKey("A-S-<Tab>", lazy.layout.previous()),
    # EzKey("M-<Return>", lazy.layout.swap_main()),
    EzKey("M-S-h", lazy.layout.swap_left(), lazy.layout.shuffle_left()),
    EzKey("M-S-j", lazy.layout.swap_down(), lazy.layout.shuffle_down()),
    EzKey("M-S-k", lazy.layout.swap_up(), lazy.layout.shuffle_up()),
    EzKey("M-S-l", lazy.layout.swap_right(), lazy.layout.shuffle_right()),
]

window_size_control = [
    EzKey("M-C-h", lazy.layout.grow_left()),
    EzKey("M-C-j", lazy.layout.grow_down()),
    EzKey("M-C-k", lazy.layout.grow_up()),
    EzKey("M-C-l", lazy.layout.grow_right()),
    EzKey("M-C-n", lazy.layout.normalize()),  # Restore to original size
]

toggles = [
    EzKey("M-q", lazy.window.kill()),
    #EzKey("M-<space>", lazy.next_layout()),
    EzKey("M-S-f", lazy.window.toggle_floating()),
    EzKey("M-f", lazy.window.toggle_fullscreen()),
]

qtile_controls = [
    EzKey("M-C-r", lazy.restart()),
    EzKey("M-C-q", lazy.shutdown()),
]

rofi_spawns = [
    EzKey("M-p", lazy.spawn("rofi -show drun")),
    EzKey("M-S-p", lazy.spawn("rofi -show window")),
]

application_spawns = [
    EzKey("M-<Return>", lazy.spawn(myTerminal)),
    EzKey("M-b", lazy.spawn(myBrowser)),
    EzKey("M-S-b", lazy.spawn(f"{myBrowser} --incognito")),
]

audio_controls = [
    EzKey("<XF86AudioMute>", lazy.spawn("pamixer -m")),
    EzKey("<XF86AudioRaiseVolume>", lazy.spawn("pamixer -i 5")),
    EzKey("<XF86AudioLowerVolume>", lazy.spawn("pamixer -d 5")),
    EzKey("<XF86AudioMicMute>", lazy.spawn("micvol --mute")),
]

media_controls = [
    EzKey("M-<Down>", lazy.spawn("playerctl -p spotify play-pause")),
    EzKey("M-<Right>", lazy.spawn("playerctl -p spotify next")),
    EzKey("M-<Left>", lazy.spawn("playerctl -p spotify previous")),
    EzKey("M-S-<Down>", lazy.spawn(expanduser("~/scripts/spotify-toggle-mute.nu"))),
    EzKey("M-S-<Right>", lazy.spawn(expanduser("~/scripts/spotify-volume-up.nu"))),
    EzKey("M-S-<Left>", lazy.spawn(expanduser("~/scripts/spotify-volume-down.nu"))),
    EzKey("M-C-<Right>", lazy.spawn("playerctl -p spotify position 5+")),
    EzKey("M-C-<Left>", lazy.spawn("playerctl -p spotify position 5-")),
]

screenshot = [
    EzKey("<Print>", lazy.spawn("flameshot gui")),
    EzKey("M-<Print>", lazy.spawn("flameshot screen")),
]

brightness_controls = [
    EzKey("<XF86MonBrightnessUp>", lazy.spawn("brightctl --up")),
    EzKey("<XF86MonBrightnessDown>", lazy.spawn("brightctl --down")),
]

quick_launch = [
    EzKey("<XF86Calculator>", lazy.spawn([myTerminal, "-T Qalc -e qalc"])),
]

keys = [
    *group_navigation,
    *window_navigation,
    *window_displacement,
    *window_size_control,
    *toggles,
    *qtile_controls,
    *rofi_spawns,
    *application_spawns,
    *audio_controls,
    *media_controls,
    *screenshot,
    *brightness_controls,
    *quick_launch,
]
