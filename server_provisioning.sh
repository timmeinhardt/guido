# Install basic command line tools
sudo apt-get install curl build-essential git-core vim nginx
sudo apt-get update

# Install Node.js
sudo apt-get install -y openssl libssl-dev pkg-config
wget http://nodejs.org/dist/v0.12.3/node-v0.12.3.tar.gz #with latest node version
tar xvf node-v*
cd node-v*
./configure
make
sudo make install
cd
rm -rf node-v*

# Install MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
service mongod start

# Install PM2
sudo npm install pm2 -g
sudo env PATH=$PATH:/usr/local/bin pm2 startup ubuntu -u ubuntu #pm2 startup ubuntu

# Configure Nginx
sudo vi /etc/nginx/sites-available/guido #add nginx configuration
sudo ln -s /etc/nginx/sites-available/guido /etc/nginx/sites-enabled/guido #adds system link
sudo rm /etc/nginx/sites-enabled/default

# Generate user for deployment
sudo adduser deploy --system --disabled-password --group --shell /bin/bash
sudo -u deploy bash  
cd /home/deploy

mkdir -p .ssh
chmod 700 .ssh
cd .ssh

echo "--paste your public key here--" > authorized_keys
chmod 600 authorized_keys
exit   
