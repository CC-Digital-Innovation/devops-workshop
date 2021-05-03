#!/usr/bin/sh -x

# stop and delete all containers
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
# delete all images
docker rmi -f $(docker images -q)

## cleanup user data
cd $HOME/devops-workshop/data/userdata
sudo rm -rf user*

## cleanup app data
cd $HOME/devops-workshop/data/appdata
sudo rm -rf gitea
sudo rm -rf jenkins

## start slack-docker
cd $HOME/devops-workshop/observability/slack-docker
docker-compose up -d --build

## start prometheus and graffana for observability
cd $HOME/devops-workshop/observability/dockprom
docker-compose up -d --build

## start workshop core services nginx, git, jenkins
cd $HOME/devops-workshop/workshop-core-svcs
docker-compose up -d --build

## start portainer
cd $HOME/devops-workshop/util/portainer
docker-compose up -d --build

## start slack-invite-automation
cd $HOME/devops-workshop/util/slack-invite-automation
docker-compose up -d --build

## strart user fake switch contianers
cd $HOME/devops-workshop/fake-switches
./build-fake-switches.sh

## start user dev env containers
cd $HOME/devops-workshop/workshop-user-envs
./build-user-envs.sh

## stage data in containers
cd $HOME/devops-workshop
sudo chown -R workshop:workshop $HOME/devops-workshop/data/userdata
for d in $HOME/devops-workshop/data/userdata/user*/config; do cp .ansible.cfg "$d"; done
for d in $HOME/devops-workshop/data/userdata/user*/config/workspace; do cp -R ./code "$d"; done

## show running containers
docker ps
