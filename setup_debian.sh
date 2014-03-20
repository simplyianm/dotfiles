# Mandatory stuff
sudo apt-get install zsh vim tmux xfce4 xfce4-goodies
# Git is already installed -- no need to worry.

read -p "Install social utilities? (y/n): " RESP
if [ "$RESP" = "y" ]; then
    sudo apt-get -y install pidgin xchat
fi

read -p "Install development tools? (y/n): " RESP
if [ "$RESP" = "y" ]; then
    sudo apt-get -y install openjdk-7-jdk openjdk-7-jre 
    sudo apt-get -y install python
fi
