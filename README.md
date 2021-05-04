# Computacenter DevOps Workshop

## Summary

DevOps Workshop Platform Infrastructure as Code

_Note: If you have any questions or comments you can always use GitHub discussions, or DM me on the twitter @rbocchinfuso._

### Why

Developing a DevOps Workshop platform and curriculum.

## Requirements

- Docker
- Python 3 and pip
- docker-compose >= 1.28.6
- ~~docker-compose-expand >= 0.1.0~~
  - **DEPRECATED.** Replaced by build control scripts.

## Env Deployment

- Download code from GitHub

  ```bash
  git clone https://github.com/CC-Digital-Innovation/devops-workshop.git
  ```

  _Note: If you don't have Git installed you can also just grab the zip:
  [https://github.com/CC-Digital-Innovation/devops-workshop/archive/master.zip](https://github.com/CC-Digital-Innovation/devops-workshop/archive/master.zip)_

### **_DEPRECATED_**

~~- Make any required changes to the docker-compose-expand.yml files in the ./devops-workshop/workshop-user-envs and ./devops-workshop/fake-switches directory~~

- ~~Launch fake switch containers~~

  ```bash
  cd ./devops-workshop/fake-switches
  docker-compose-expand up -d --build
  ```

- ~~Launch required user env containers, and shared git and Jenkins containers~~

  ```bash
  cd ./devops-workshop/workshop-user-envs
  docker-compose-expand up -d --build
  ```

## Build Process Now Controlled by Control Scripts

- **./control-scripts/build.sh**: Rebuild entire DevOps Workshop environment
  - **WARNING: DESTRUCTIVE ACTION**
- **./control-scripts/down.sh**: Shuts down the DevOps Workshop environment
  - INFO: No data loss
- **./control-scripts/up.sh**: Stats up the DevOps Workshop environment
  - INFO: Data is persistent
- **./control-scripts/init.sh**: Reinitialize all WorkShop user environments
  - **WARNING: DESTRUCTIVE ACTION**
  - INFO: Significantly faster han build.sh because the containers are not rebuilt
- **./control-scripts/nuke.sh**: Cleans up all containers

  - **WARNING: DESTRUCTIVE ACTION**

- Check that user envs, fake switches, git and Jenkins containers are running

  ```bash
  docker ps
  ```

  ![image-20210325160024189](https://i.imgur.com/WbvvYVh.png)

## Configuration

- ~~Setup user envs~~

  - **DEPRECATED.** Now handled by build control scripts.

    ```bash
    cd ./devops-workshop/config
    chmod 755 setup.sh
    sh -x ./setup.sh
    ```

  _The above Adds .ansible.cfg and simple ansible switch config playbook to each user env._

## Usage

- Access the user cloud dev environment

  ```http
  http://user1.quokka.ninja
  ```

  - ~~ The included _docker-compose-expand.yml_ file deploys eleven (10) users envs on port 8000 - 8010.~~
  - Ten user environments are deployed and registerd with Nginx reverse proxy. Environments are accessible using the url(s) http://user[1 to 10].quokka.ninja
  - ~~The default user env password configured in _docker-compose-expand.yml_ is "workshop"~~
  - The default user env password is "workshop"
  - ~~The default sudo password configure in the _docker-compose-expand.yml_ file is "root"~~
  - The default sudo password configure is "root"
  -

- SSH to fake switch form your user env

  ```bash
  ssh root@hostname -p 2200
  ```

  - ~~The included _docker-compose-expand.yml_ file deploys eleven (11) switches on port 2200 - 2210.~~
  - There are ten (10) deployed switched available on ports 2201 - 2210
  - ~~The default username configured in _docker-compose-expand.yml_ is "root"~~
  - The default username configured in is "root"
  - ~~The default password configure in the _docker-compose-expand.yml_ file is "root"~~
  - The default password is "root"

- Play with the example Ansible playbook

  - Launch Terminal from cloud dev env (Ctrl+Shift+`)

  ```bash
  cd ~/workspace/code/switch-ansible-example
  ansible-playbook --list-hosts -i inventory example-playbook.yml
  ansible-playbook -i inventory example-playbook.yml
  ```

## To Do

- [ ] Configure Gitea
  - **DEPRECATED.** Decided to use GitHub.
- [ ] Configure Jenkins
  - **DEPRECATED.** Decided to use Watchtower and Docker Hub, for simplicity and to give the User control and visability of the build and deploy process within their user env.
- [ ] Connect the E2E pipeline
  - **COMPLETED**
- [ ] Build lab scenarios
  - **IN PROGRESS.** Documenting and fixing issues and bugs.
- [x] Add cAdvisor, Prometheus and Grafana for observability

## Reference Information

Mindmap: https://www.mindmeister.com/1798964771/devops-for-ops-workshop

## Compatibility

This is was built and tested on Ubuntu 20.04 and most likely will only work on any Linux distro.

## Disclaimer

The code provided in this project is an open source example and should not be treated as an officially supported product. Use at your own risk. If you encounter any problems, please log an [issue](https://github.com/CC-Digital-Innovation/devops-workshop/issues).

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request ツ

## History

- version 0.1.0 (initial release) - 2021/03/25
- version 0.8.0 (alpha release) - 2021/05/04

## Credits

Rich Bocchinfuso <<rbocchinfuso@gmail.com>>

## License

MIT License

Copyright (c) [2021] [Richard J. Bocchinfuso]

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
