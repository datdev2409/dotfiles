ssh-keygen -t ed25519 -C "datdev2409@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub

sudo pacman -Syu
sudo pacman -S kitty

ln -s ~/dotfiles/qtile/ ~/.config/
ln -s ~/dotfiles/nvim/ ~/.config/
ln -s ~/dotfiles/kitty/ ~/.config/
ln -s ~/dotfiles/.gitconfig ~/

# Packer nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# ZSH and OHMYZSH
sudo pacman -S zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s ~/dotfiles/.zshrc ~
