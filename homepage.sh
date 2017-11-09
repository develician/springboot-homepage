#!/bin/bash
sudo service homepage stop
sleep 5;
echo `pwd`
cp -f target/*.war /home/ec2-user/homepage.war
chmod 755 /home/ec2-user/homepage.war
sudo rm -rf /etc/init.d/homepage
sudo ln -s /home/ec2-user/homepage.war /etc/init.d/homepage
sudo service homepage start
