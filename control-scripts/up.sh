#!/usr/bin/sh -x

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

## show running containers
docker ps