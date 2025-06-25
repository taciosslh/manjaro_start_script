sudo -v
sudo sed -i 's/ParallelDownloads = 4/ParallelDownloads = 10/g' /etc/pacman.conf
sudo pacman-mirrors --continent
sudo pacman -Syyu
sudo cp -R /mnt/start .
sudo chown -R $USER:$USER start
sudo pacman -Sc
