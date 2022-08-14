# Load zsh config
source ~/.config/zsh/config.zsh

for file in ~/.config/zsh/conf.d/*.zsh; do
  source "${file}"
done
