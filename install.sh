my_dir=`pwd`

ln -sf "$my_dir"/atom/config.cson ~/.atom/config.cson;
echo "Atom config.cson linked!";

ln -sf "$my_dir"/atom/keymap.cson ~/.atom/keymap.cson;
echo "Atom keymap.cson linked!";

ln -sf "$my_dir"/atom/styles.less ~/.atom/styles.less;
echo "Atom styles.less linked!";

mkdir ~/.bash;
ln -sf "$my_dir"/bash/git-prompt ~/.bash/git-prompt;
echo "bash git-prompt linked!";

ln -sf "$my_dir"/bash/bash_profile ~/.bash_profile;
echo "bash_profile linked!";

ln -sf "$my_dir"/git/gitconfig ~/.gitconfig;
echo "gitconfig linked!";

ln -sf "$my_dir"/hyper/hyper.js  ~/.hyper.js;
echo "hyper.js linked!";

ln -sf "$my_dir"/karabiner/karabiner.json  ~/.config/karabiner/karabiner.json;
echo "Karabiner linked!";

ln -sf "$my_dir"/kitty/kitty.conf  ~/.config/kitty/kitty.conf;
echo "kitty linked!";

ln -sf "$my_dir"/slate/slate  ~/.slate;
echo "slate linked!";

ln -sf "$my_dir"/sublime/profile.sublime-keymap ~/Library/"Application Support"/"Sublime Text 3"/Packages/User/"Default (OSX).sublime-keymap";
echo "Sublime linked!";

cp -r "$my_dir"/vim/autoload ~/.vim/autoload;
echo "vim autoload linked!";

cp -r "$my_dir"/vim/colors ~/.vim/colors;
echo "vim colors linked!";

ln -sf "$my_dir"/vim/init.vim  ~/.vimrc;
echo "vimrc linked!";