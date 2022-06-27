#!/usr/bin/python3
from colorama.ansi import Fore
from os import path
import os

CONFIG = [
    ["Git", "user/git", "~/.config/git"],
    ["Rofi", "user/rofi", "~/.config/rofi"],
    ["Picom", "user/picom", "~/.config/picom"],
    ["Lunarvim", "user/lunarvim", "~/.config/lvim"],
    ["Awesome", "user/awesome/", "~/.config/awesome"],
    ["Cargo", "user/cargo/config.toml", "~/.cargo/config.toml"],
    ["Alacritty", "user/alacritty", "~/.config/alacritty"],
    ["Awesome", "user/awesome", "~/.config/awesome"],
    ["Weechat", "user/weechat", "~/.config/weechat"],
    ["Zsh", "user/.zshrc", "~/.zshrc"],
    ["(System) Paru", "system/paru.conf", "/etc/paru.conf"],
]
SUDO = "doas"
BANNER = f"""{Fore.RED}
>> ▒█▀▀▄ ▒█▀▀▀█ ▀▀█▀▀ ▒█▀▀▀ ▀█▀ ▒█░░░ ▒█▀▀▀ 　
>> ▒█░▒█ ▒█░░▒█ ░▒█░░ ▒█▀▀▀ ▒█░ ▒█░░░ ▒█▀▀▀ 　
>> ▒█▄▄▀ ▒█▄▄▄█ ░▒█░░ ▒█░░░ ▄█▄ ▒█▄▄█ ▒█▄▄▄ 　

>> ▀█▀ ▒█▄░▒█ ▒█▀▀▀█ ▀▀█▀▀ ░█▀▀█ ▒█░░░ ▒█░░░ ▒█▀▀▀ ▒█▀▀█
>> ▒█░ ▒█▒█▒█ ░▀▀▀▄▄ ░▒█░░ ▒█▄▄█ ▒█░░░ ▒█░░░ ▒█▀▀▀ ▒█▄▄▀
>> ▄█▄ ▒█░░▀█ ▒█▄▄▄█ ░▒█░░ ▒█░▒█ ▒█▄▄█ ▒█▄▄█ ▒█▄▄▄ ▒█░▒█
{Fore.RESET}"""
print(BANNER)
join = lambda lst: "".join(lst)
info = lambda *text: print(f"{Fore.GREEN}{join(text)}{Fore.RESET}")
error = lambda *text: print(f"{Fore.YELLOW}{join(text)}{Fore.RESET}")


def link(source: str, to: str):
    to = to.replace("~", os.getenv("HOME") or "/root/")

    if not path.exists(to):
        os.symlink(path.realpath(source), to)
    else:
        error(f"Warn: Directory {to} exists. skipping!")


for conf in CONFIG:
    info(f"Info: Linking {conf[0]} config")
    if "System" in conf[0]:
        if os.system(f"{SUDO} cp {conf[1]} {conf[2]} -f") == 0:
            pass
    else:
        link(conf[1], conf[2])
