sudo pacman -Syu
sudo pacman -S kitty

ln -s ~/dotfiles/qtile/ ~/.config/
ln -s ~/dotfiles/nvim/ ~/.config/
ln -s ~/dotfiles/kitty/ ~/.config/

# Packer nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# ZSH and OHMYZSH
sudo pacman -S zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s ~/dotfiles/.zshrc ~
