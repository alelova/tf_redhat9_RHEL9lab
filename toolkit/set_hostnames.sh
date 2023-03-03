#! /bin/bash
export servera="$(./aws_describe-instances.sh|grep 001|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}') servera"
export serverb="$(./aws_describe-instances.sh|grep 002|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}') serverb"
sudo sed  -i '/server/d' /etc/hosts
echo $servera | sudo tee --append /etc/hosts
echo $serverb | sudo tee --append /etc/hosts

rm ~/.ssh/known_hosts
#### set servera
   ssh student@servera sudo hostnamectl set-hostname servera
   ssh student@servera sudo sed  -i '/server/d' /etc/hosts
   ssh student@servera "echo "$servera" | sudo tee --append /etc/hosts"
   ssh student@servera "echo "$serverb" | sudo tee --append /etc/hosts"

#### set serverb
   ssh student@serverb sudo hostnamectl set-hostname serverb
   ssh student@serverb sudo sed  -i '/server/d' /etc/hosts
   ssh student@serverb "echo "$servera" | sudo tee --append /etc/hosts"
   ssh student@serverb "echo "$serverb" | sudo tee --append /etc/hosts"
