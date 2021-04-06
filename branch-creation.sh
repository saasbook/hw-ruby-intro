#!/bin/bash

source ./.github/CHIPS-config.sh
if ! [[ `git -c user.name="GitHub Actions" -c user.email="actions@github.com" subtree pull --prefix .github/workflows/ https://github.com/evan1997123/chips_github_workflows.git master --squash 2>&1` = *"Subtree is already at commit"* ]]; then
    echo "need to pull"
    git push origin develop
    exit
fi

git checkout -b develop-starter-code

python3 ./.github/workflows/evaluate-hierarchy.py ./build_starter_code.json

#https://unix.stackexchange.com/questions/422392/delete-all-folders-inside-a-folder-except-one-with-specific-name 

# move .git into root folder
mv .git ./root

# remove everything by root folder
find . -mindepth 1 ! -regex "${final_folder}" -delete

# move everything up one directory
mv root/* root/.[!.]* . && rmdir root

git add -A

git -c user.name="GitHub Actions" -c user.email="actions@github.com" commit -m "${commit_message}" --author="$CURRENT_USER <$CURRENT_USER@users.noreply.github.com>"

git remote add not-ci ${not_ci_repo_ssh}

git fetch --unshallow not-ci

if [[ `git branch -r 2>&1` = *not-ci/develop-starter-code* ]]; then
    echo "pull develop-starter-code"
    PUSH_OPT=""
else
    echo "no need to pull develop-starter-code"
    PUSH_OPT="-u"
fi

git push -f ${PUSH_OPT} not-ci develop-starter-code

git checkout develop

if [[ `git branch 2>&1` = *develop-codio* ]]; then
    echo "no need to create a new branch"
    git branch -d develop-codio
fi

git checkout -b develop-codio

python3 ./.github/workflows/evaluate-hierarchy.py ./build_codio.json

#https://unix.stackexchange.com/questions/422392/delete-all-folders-inside-a-folder-except-one-with-specific-name


# move .git into root folder
mv .git ./root

# remove everything by root folder
find . -mindepth 1 ! -regex "${final_folder}" -delete

# move everything up one directory
mv root/* root/.[!.]* . && rmdir root

git add -A

git -c user.name="GitHub Actions" -c user.email="actions@github.com" commit -m "${commit_message}" --author="$CURRENT_USER <$CURRENT_USER@users.noreply.github.com>"

if [[ `git branch -r 2>&1` = *origin/develop-codio* ]]; then
    echo "pull develop-codio"
    PUSH_OPT=""
else
    echo "no need to pull develop-codio"
    PUSH_OPT="-u"
fi

git push -f ${PUSH_OPT} origin develop-codio

