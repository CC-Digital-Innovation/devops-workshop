#!/usr/bin/sh -x

## strart user fake switch contianers
cd $HOME/devops-workshop/fake-switches
docker-compose -f fake-switches.yml down

## start user dev env containers
cd $HOME/devops-workshop/workshop-user-envs
docker-compose -f user-envs.yml down

## show running containers
docker ps

## cleanup user data
cd $HOME/devops-workshop/data/userdata
sudo rm -rf user*

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
# cd $HOME/devops-workshop/util/slack-invite-automation
# docker-compose up -d --build

## strart user fake switch contianers
cd $HOME/devops-workshop/fake-switches
./build-fake-switches.sh

## start user dev env containers
cd $HOME/devops-workshop/workshop-user-envs
./build-user-envs.sh

## stage data in containers
cd $HOME/devops-workshop
sudo chown -R workshop:workshop $HOME/devops-workshop/data/userdata
for d in $HOME/devops-workshop/data/userdata/user*/config; do cp ./code/.ansible.cfg "$d"; done
for d in $HOME/devops-workshop/data/userdata/user*/config/workspace; do cp -R ./code "$d"; done

## show running containers
docker ps
