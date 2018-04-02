sudo add-apt-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get -y install ansible git
ssh-keygen -q -b 2048 -t rsa -N "" -f ~/.ssh/id_rsa
