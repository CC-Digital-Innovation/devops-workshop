#!/usr/bin/sh -x

## stop user fake switch contianers
cd $HOME/devops-workshop/fake-switches
docker-compose -f fake-switches.yml down

## stop user dev env containers
cd $HOME/devops-workshop/workshop-user-envs
docker-compose -f user-envs.yml down

## stop slack-invite-automation
# cd $HOME/devops-workshop/util/slack-invite-automation
# docker-compose down

## stop portainer
cd $HOME/devops-workshop/util/portainer
docker-compose down

## stop workshop core services nginx, git, jenkins
cd $HOME/devops-workshop/workshop-core-svcs
docker-compose down

## stop prometheus and graffana
cd $HOME/devops-workshop/observability/dockprom
docker-compose down

## stop slack-docker
cd $HOME/devops-workshop/observability/slack-docker
docker-compose down

## show running containers
docker ps