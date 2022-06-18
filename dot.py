#!/usr/bin/python3
CONFIG = [
    ["Git", 'user/git', '~/.config/git'],
    ["Sxhkd", 'user/sxhkd', '~/.config/sxhkd'],
    ["Dunst (Notification daemon)", 'user/dunst', '~/.config/dunst'],
    ["Rofi", 'user/rofi', '~/.config/rofi'],
    ["Bspwm", 'user/bspwm', '~/.config/bspwm'],
    ["Picom", 'user/picom', '~/.config/picom'],
    ["Eww"  , 'user/eww',  '~/.config/eww'],
    ['Neovim', 'user/nvim', '~/.config/nvim'],
    ["Cargo", 'user/cargo/config.toml', '~/.cargo/config.toml'],
    ["Kitty", 'user/kitty', '~/.config/kitty'],
    ["Weechat", 'user/weechat', '~/.config/weechat'],
    ["Zsh", 'user/zsh', '~/.config/zsh'],
    ["Zsh RC", 'user/zsh/conf.zsh', '~/.zshrc'],
    ["(System) Paru" ,'system/paru.conf', '/etc/paru.conf']
]
SUDO = 'doas'
from colorama.ansi import Fore
from os import path
import os
BANNER = f"""{Fore.RED}
>> ▒█▀▀▄ ▒█▀▀▀█ ▀▀█▀▀ ▒█▀▀▀ ▀█▀ ▒█░░░ ▒█▀▀▀ 　
>> ▒█░▒█ ▒█░░▒█ ░▒█░░ ▒█▀▀▀ ▒█░ ▒█░░░ ▒█▀▀▀ 　
>> ▒█▄▄▀ ▒█▄▄▄█ ░▒█░░ ▒█░░░ ▄█▄ ▒█▄▄█ ▒█▄▄▄ 　

>> ▀█▀ ▒█▄░▒█ ▒█▀▀▀█ ▀▀█▀▀ ░█▀▀█ ▒█░░░ ▒█░░░ ▒█▀▀▀ ▒█▀▀█
>> ▒█░ ▒█▒█▒█ ░▀▀▀▄▄ ░▒█░░ ▒█▄▄█ ▒█░░░ ▒█░░░ ▒█▀▀▀ ▒█▄▄▀
>> ▄█▄ ▒█░░▀█ ▒█▄▄▄█ ░▒█░░ ▒█░▒█ ▒█▄▄█ ▒█▄▄█ ▒█▄▄▄ ▒█░▒█
{Fore.RESET}"""
print(BANNER)
join = lambda lst: ''.join(lst)
info = lambda *text: print(f"{Fore.GREEN}{join(text)}{Fore.RESET}")
error = lambda *text: print(f"{Fore.YELLOW}{join(text)}{Fore.RESET}")
def link(source: str, to: str):
    to = to.replace("~", os.getenv("HOME") or "/root/")

    if not path.exists(to):
        os.symlink(path.realpath(source), to)
    else:
        error(f"Warn: Directory {to} existis. skipping!")
for conf in CONFIG:
    info(f"Info: Linking {conf[0]} config")
    if 'System' in conf[0]:
        if os.system(f'{SUDO} cp {conf[1]} {conf[2]} -f') == 0: pass
    else:
        link(conf[1], conf[2])

