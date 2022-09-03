import {
  bold,
  green,
  red,
  underline,
  yellow,
} from "https://deno.land/std@0.151.0/fmt/colors.ts";

import { existsSync } from "https://deno.land/std@0.151.0/fs/mod.ts";
const HOME = Deno.env.get("HOME");
const FONTS_DIR = `${HOME}/.local/share/fonts`;

const CONFIGS: [string, string, string][] = [
  ["etc/ZshRc.zsh", "~/.zshrc", "Zsh config loader"],
  ["app/shell/zsh", "~/.config/zsh", "Zsh"],
  ["app/wezterm", "~/.config/wezterm", "Wezterm"],
  ["editor/neovim", "~/.config/nvim", "Neovim"],
  ["app/dunst", "~/.config/dunst", "Dunst"],
  ["app/alacritty", "~/.config/alacritty", "Alacritty"],
  ["app/picom", "~/.config/picom", "Picom"],
  ["wm/i3", "~/.config/i3", "i3 Window Manager"],
  ["wm/bspwm", "~/.config/bspwm", "BSP Window Manager"],
  ["wm/sxhkd", "~/.config/sxhkd", "Simple X Keybind Manager"],
  ["wm/polybar", "~/.config/polybar", "Polybar"],
  ["etc/starship.toml", "~/.config/starship.toml", "Starship"],
  ["app/git", "~/.config/git", "Git"],
  ["app/pacman", "~/.config/pacman", "Pacman user config"],
  ["app/rofi", "~/.config/rofi", "Rofi"],
  ["lang/rust/cargo/Cargo.toml", "~/.cargo/config.toml", "Cargo config"],
];

const result = await prompt(
  `Do you want to install this dotfiles?\n [${red("n")}/${green("y")}]`,
);
if (result == "n") Deno.exit(0);

const info = (scope) => bold(green(`info(${scope}):`));
const warn = (scope) => bold(yellow(`warn(${scope}):`));

const futs = CONFIGS.map(async (config) => {
  const [name, to, details] = config;
  console.log(`${info("conf")} installing ${details} (${underline(name)})`);
  const realPath = await Deno.realPath(`confs/${name}`);
  const target = to.replace("~", HOME);
  if (!existsSync(target)) {
    await Deno.symlink(realPath, target);
  }
});

if (!existsSync(FONTS_DIR)) {
  console.log(
    `${warn("font")} can't find ${
      underline(
        "~/.local/share/fonts",
      )
    }. creating it.`,
  );
  await Deno.mkdir(FONTS_DIR, { recursive: true });
}

for await (const entry of Deno.readDir("fonts")) {
  const { name } = entry;
  console.log(`${info("font")} installing ${underline(name)}`);
  Deno.copyFile(`fonts/${name}`, `${FONTS_DIR}/${name}`);
}

console.log(`${info("font")} generating font cache`);
await Deno.run({ cmd: ["fc-cache"] });
await Promise.all(futs);
