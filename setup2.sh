#!/bin/zsh
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
source ~/.zshrc
zinit self-update
rm ~/.zshrc
cp .zshrc ~/.zshrc
source ~/.zshrc
#configure nvim
sudo apt install nvim tmux ripgrep python3 -y
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
mv ~/.config/nvim ~/.config/nvimbackup
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync
git clone https://github.com/hzerbini/AstroNVimConfig.git ~/.config/nvim/lua/user

#configure tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

rm ~/.tmux.conf
cp .tmux.conf ~/.tmux.conf

tmux source ~/.tmux.conf
