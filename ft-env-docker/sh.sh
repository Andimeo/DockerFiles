#sudo apt-get install bridge-utils
sudo service docker stop
sudo iptables -t nat -F
sudo ifconfig docker0 down
sudo brctl delbr docker0
sudo service docker start
