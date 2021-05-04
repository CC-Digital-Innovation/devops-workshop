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

11. Configure Git in your workspace

    ```bash
    git config --global user.email "you@example.com"
    git config --global user.name "Your Name"
    ```

12. Commit hello-world to your newly created GitHub Repo

      *Note:  Make sure you are in the hello-world directory.*

      ```text
      git init
      git add . -A
      git commit -m "first commit"
      git branch -M main
      git remote add origin https://github.com/[YOUR_GITHUB]/hello-world.git
      git push -u origin main
      ```

13. Create a Docker Hub Repository
    1. Name:  hello-world
    2. Public
    3. Build Settings
       1. Click GitHub Logo
          1. Select Organization (aka your GitHub account)
          2. Select Repository (hello-world, this is the repo we just committed to.)
          3. Click the + to add a build rule
             1. Change the branch to "main"
    4. Click "Create & Build"

## Noteworthy Helpers

- Commit Script

   ```sh
   ./code/commit.sh "commit message"
   ```

- Cleanup All Containers **(BE CAREFUL)**

   ```sh
   ./code/nuke.sh
   ```
