FROM ghcr.io/linuxserver/code-server:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install python3 python3-pip
RUN apt-get -y install apt-transport-https ca-certificates curl gnupg lsb-release
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get -y install software-properties-common
RUN apt-add-repository ppa:ansible/ansible
RUN apt-get -y install ansible
RUN apt-get update
RUN apt-get -y install docker-ce docker-ce-cli containerd.io=1.4.4-1
RUN usermod -aG docker abc
RUN pip3 install --upgrade pip
RUN pip3 install docker-compose
CMD service docker start && tail -F /var/log/docker.log	