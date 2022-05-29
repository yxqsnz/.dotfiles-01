#!/usr/bin/python3
CONFIG = [
    ['zsh', 'user/zsh', '~/.config/zsh'],
    ['zsh-rc', 'user/zsh/conf.zsh', '~/.zshrc'],
    ['Ranger', 'user/ranger', '~/.config/ranger'],
    ['Kitty', 'user/kitty', '~/.config/kitty'],
    ['Rofi', 'user/rofi', '~/.config/rofi'],
    ["Git", 'user/git', '~/.config/git'],
    ['Neovim', 'user/nvim', '~/.config/nvim'],
    ["Oh My Zsh", 'user/oh-my-zsh', '~/.oh-my-zsh'],
    ["Cargo", 'user/cargo/config.toml', '~/.cargo/config.toml'],
    ["Weechat", 'user/weechat', '~/.config/weechat'],
]
SUDO = 'sudo'
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
        error(f">>= Directory {to} existis. skipping!")
for conf in CONFIG:
    info(f">>= Linking {conf[0]} config")
    if 'system:' in conf[0]:
        os.system(f'{SUDO} cp {conf[1]} {conf[2]} -f')
    else:
        link(conf[1], conf[2])

