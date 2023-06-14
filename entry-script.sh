#!bin/bash
sudo yum install -y && sudo yum install docker
sudo systemctl star docker
sudo usermod -aG docker ec2-user
docker run -p 8080:80 ngix