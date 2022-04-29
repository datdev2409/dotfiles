# Install pakages
sudo pacman -Syu
sudo pacman -S neovim
sudo pacman -S kitty
sudo pacman -S picom

# Create backup file
mv ~/.config/nvim ~/.config/nvim_backup
mv ~/.config/kitty ~/.config/kitty_backup
mv ~/.config/picom ~/.config/picom_backup
mv ~/.config/polybar ~/.config/polybar_backup
mv ~/.config/i3 ~/.config/i3_backup

# Copy config from dotfiles to .config
cp -r ~/dotfiles/nvim ~/.config
cp -r ~/dotfiles/i3 ~/.config
cp -r ~/dotfiles/picom ~/.config
cp -r ~/dotfiles/kitty ~/.config
cp -r ~/dotfiles/nvim ~/.config
