#!/bin/bash

USERNAME=$1
TOKEN=$2
REPONAME=$3

mkdir "$REPONAME"
cd "$REPONAME"
git init

git branch -m master main
git status
git config --global user.name "DevSecOps"

mkdir .github
cd .github
echo "Insert here your security policies" > SECURITY.md
git add .

git commit -m "Security added"
git remote -v
git remote add origin git@github.com:$USERNAME/$REPONAME.git

#Create new repo in github.
curl \
    -u $USERNAME:$TOKEN \
    -d "{\"name\":\"$REPONAME\",\"private\":\"true\"}" \
  https://api.github.com/user/repos

#Below syntax 'git push https://<tocken>@github.com/username/reponame.git branchname'
git push --force "https://$TOKEN@github.com/$USERNAME/$REPONAME.git" main
