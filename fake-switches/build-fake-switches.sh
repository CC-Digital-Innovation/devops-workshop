#!/usr/bin/sh

buildComposeYaml() {
cat <<HEADER
  version: '3'
  services:
HEADER
  cat <<BASEIMG
    fake-switch:
        build:
          context: .
          dockerfile: Dockerfile
        container_name: ${CONTAINER_NAME:-fake-switch-master}
        runtime: sysbox-runc
        environment:
          - SWITCH_MODEL=cisco_2960_48TT_L
        ports:
          - "2200:22"
        restart: unless-stopped
BASEIMG
  for i in $(seq 10); do
    port=`expr 2200 + $i`
    cat <<BLOCK
    switch$i:
      image: fake-switches_fake-switch
      container_name: fake-switch-$i
      runtime: sysbox-runc
      environment:
        - SWITCH_MODEL=cisco_2960_48TT_L
        - SWITCH_HOSTNAME=switch$i
      ports:
        - "$port:22"
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

# buildComposeYaml 
# buildComposeYaml | docker-compose -f - "$@" config
buildComposeYaml > fake-switches.yml
docker-compose -f fake-switches.yml up -d --build

