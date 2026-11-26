#!/bin/sh
set -eu

my_dir=$(cd "$(dirname "$0")" && pwd)

link() {
    mkdir -p "$(dirname "$2")"
    if [ -d "$2" ] && [ ! -L "$2" ]; then
        mv "$2" "$2.bak"
    fi
    ln -sfn "$my_dir/$1" "$2"
    echo "linked $2"
}

link zsh/zshrc ~/.zshrc
link zsh/zshenv ~/.zshenv
link zsh/griffin.zsh-theme ~/.oh-my-zsh/custom/themes/griffin.zsh-theme
link git/gitconfig ~/.gitconfig
link git/ignore ~/.config/git/ignore
link vim/init.vim ~/.config/nvim/init.vim
link vim/autoload ~/.config/nvim/autoload
link vim/colors ~/.config/nvim/colors
link kitty/kitty.conf ~/.config/kitty/kitty.conf
link kitty/kitty-dark.conf ~/.config/kitty/kitty-dark.conf
link kitty/kitty-light.conf ~/.config/kitty/kitty-light.conf

case "$(uname)" in
Darwin)
    link cursor/settings.json ~/Library/"Application Support"/Cursor/User/settings.json
    link cursor/keybindings.json ~/Library/"Application Support"/Cursor/User/keybindings.json
    link skhd/skhdrc ~/.skhdrc
    link yabai/yabairc ~/.yabairc
    link sketchybar ~/.config/sketchybar
    sudo install -o root -g wheel -m 755 "$my_dir/yabai/yabai-load-sa" /usr/local/libexec/yabai-load-sa
    echo "installed /usr/local/libexec/yabai-load-sa"
    ;;
Linux)
    link cursor/settings.json ~/.config/Cursor/User/settings.json
    link cursor/keybindings.json ~/.config/Cursor/User/keybindings.json
    link i3/config ~/.config/i3/config
    ;;
esac
