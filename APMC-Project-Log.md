# AiCore Project Log

Author: Alain Culos   
Date created: 2024-01-03


# Milestones 1 & 2 - Fork repo and run App

Clone the "starter" repo & set-up my local environment:
```
git clone git@github.com:apmcgh/AiCore-DevOpsProject-WebApp.git
cd AiCore-DevOpsProject-WebApp
conda create -n AiCore-DevOpsProject-WebApp
conda activate AiCore-DevOpsProject-WebApp
cat requirements.txt 
conda install --file requirements.txt
snap code run .
```

Note: the dev branch used environment variables, so I created a test azure DB.
I got the connection working, but hit a 'bug' as the DB was empty.

I had to enable SQL authentication for the DB server (azure portal).

This, however, was unnecessary at this stage as the main branch used hard coded DB credentials.

Azure Portal DB: Query editor
```
CREATE USER [TestUser] WITH PASSWORD = 'tP1243tP';
EXEC sp_addrolemember 'db_datareader', 'TestUser';
EXEC sp_addrolemember 'db_datawriter', 'TestUser';
```

When making the change to add a delivery date, I realised that the change could not work as the DB had not been modified to add the extra field. A complete change would require some schema migration.

When reverting the change, I learnt that git revert must target the first commit of the unwanted change rather than the previous commit. Also if the git status is dirty while "reverting", the git revert will include unwanted changes.


# Milestone 3 - Containerisation

Create Dockerfile 
```
git branch feature/containerise-application
git co feature/containerise-application 
git add Dockerfile 
git commit -m 'adds Dockerfile'
git push --set-upstream origin feature/containerise-application
docker build -t aicore-devopsproject-webapp .

docker run -p 5000:5000 aicore-devopsproject-webapp
docker tag aicore-devopsproject-webapp:latest asoundmove/aicore-devopsproject-webapp:latest
docker push  asoundmove/aicore-devopsproject-webapp:latest
```

I needed to create a 'repository' (using the name of the image I wanted to store my build under) in docker hub, before I could push it.

I learnt that the Dockerfile COPY with a source directory copies only the contents of that directory rather than the directory itself (and contents). So in order to avoid copying unwanted files, I had to copy files and directories as separate commands.

Kept track of everything in a feature branch, then merged to main.


# Milestones 4 & 5 - IaC, terraform

## networking module

I adapted the networking module created in an earlier lesson.   
Added a `.gitignore` before issuing `terraform init` in the module directory.   
Keeping track of changes in branch `feature/terraform`.   

Added a spell check extension to VS Code.


## AKS cluster module

I adapted the cluster module created in an earlier lesson.   


