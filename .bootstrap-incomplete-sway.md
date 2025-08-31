sudo timedatectl set-timezone America/New_York
mkdir ~/Downloads/MarkDownload
chmod -u+xrw /home/thadryan/.dotfiles/.config/sway/manage-closed-lid-refresh.sh
sudo systemctl start gdm.service
sudo systemctl enable gdm.service
eudo grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
sudo grub-mkconfig -o /boot/grub/grub.cfg
