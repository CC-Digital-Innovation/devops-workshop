# Environment Registry

https://bit.ly/3t4YwXv

## Getting Started

1. Register with the DevOps Slack Workspace (http://slack.quokka.ninja)

2. Claim a User Env and Fake Switch in the Environment Registry

3. Open your claimed workspace by clicking on the Dev Env URL in the sheet

4. Test that you can SSH to your designated switch from the Terminal.
   1. To access the terminal us the shortcut CTRL+SHIFT+`
   2. Copy and paste the ssh comment form Column I in the spreadsheet for your assigned env into your terminal window

5. Create a GitHub account (if you don't already have one)
   1. https://github.com/

6. Create a Docker Hub Account (if you don't' already have one)
   1. https://hub.docker.com/

7. Connect Docker Hub to GitHub to automate builds on Git commits
   1. https://docs.docker.com/docker-hub/builds/link-source/

8. Let's make sure we can successfully run a container

      ```bash
      cd ./code/hello-world
      docker-compose up -d --build
      ```

9. Let's check the container started and is running
      
      ```bash
      docker ps
      ```

      ```bash
      docker logs -f hello-world
      ```
      *NOTE: CTRL-C to break viewing the logs, or you can just open another terminal window.*

10. Create a GitHub repo called hello-world

11. Commit hello-world to your newly created GitHub Repo

      ```text
      git init
      git add . -A
      git commit -m "first commit"
      git branch -M main
      git remote add origin https://github.com/[YOUR_GITHUB]/hello-world.git
      git push -u origin main
      ```

## Noteworthy Helpers

- Commit Script

   ```sh
   ./code/commit.sh "commit message"
   ```

- Cleanup All Containers **(BE CAREFUL)**

   ```sh
   ./code/nuke.sh
   ```
