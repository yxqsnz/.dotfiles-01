#!/usr/bin/python3
CONFIG = [
    ['zsh', 'user/zsh', '~/.config/zsh'],
    ['zsh-rc', 'user/zsh/conf.zsh', '~/.zshrc'],
    ['i3 Window Manager', 'user/i3', '~/.config/i3'],
    ['Polybar', 'user/polybar', '~/.config/polybar'],
    ['Ranger', 'user/ranger', '~/.config/ranger'],
    ['Picom', 'user/picom', '~/.config/picom'],
    ['Kitty', 'user/kitty', '~/.config/kitty'],
    ['Rofi', 'user/rofi', '~/.config/rofi'],
    ["Git", 'user/git', '~/.config/git'],
    ['Neovim', 'user/nvim', '~/.config/nvim'],
    ["Oh My Zsh", 'user/oh-my-zsh', '~/.oh-my-zsh'],
    ["system:paru", "system/paru.conf", "/etc/paru.conf"]
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
error = lambda *text: print(f"{Fore.RED}{join(text)}{Fore.RESET}")
def link(source: str, to: str):
    to = to.replace("~", os.getenv("HOME") or "/root/")

    if not path.exists(to):
        os.symlink(path.realpath(source), to)
    else:
        error(f"😔 Directory {to} existis. skipping!")
for conf in CONFIG:
    info(f"🔨 Linking {conf[0]} config")
    if 'system:' in conf[0]:
        os.system(f'{SUDO} cp {conf[1]} {conf[2]} -f')
    else:
        link(conf[1], conf[2])

