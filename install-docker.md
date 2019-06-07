# install repository
sudo apt install curl
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# install docker
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce

# make user execute docker commands
sudo usermod -aG docker digz

# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
