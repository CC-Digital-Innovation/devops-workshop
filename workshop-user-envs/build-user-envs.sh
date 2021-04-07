#!/usr/bin/sh

buildComposeYaml() {
cat <<HEADER
  version: '3'
  services:
HEADER
  for i in $(seq 10); do
    cat <<BLOCK
    user$i:
      image: workshop-user-envs_code-server
      container_name: workshop-user$i-env
      runtime: sysbox-runc
      environment:
        - PUID=100$i
        - PGID=100$i
        - TZ=US/Eastern
        - PASSWORD=workshop
        - SUDO_PASSWORD=root
        - VIRTUAL_HOST=user$i.quokka.ninja
        - VIRTUAL_PORT=8443
      volumes:
        - $HOME/devops-workshop/data/userdata/user$i/config:/config
      expose:
        - 8443
      restart: unless-stopped
BLOCK
  done
cat <<OTHER
  networks:
    default:
      external:
        name: devops-workshop-net
OTHER
}

# buildComposeYaml | docker-compose -f - "$@" config
# buildComposeYaml | docker-compose -f - "$@" up -d --build
buildComposeYaml > user-envs.yml
docker-compose -f user-envs.yml up -d --build
