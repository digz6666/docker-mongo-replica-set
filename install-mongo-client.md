# add apt key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4

# add apt repository
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb.list

# install mongo client
sudo apt update
sudo apt install mongodb-org-shell

# connect to mongo
mongo ast_starter --port 27017 -u digz -p "ast_digz" --authenticationDatabase admin
