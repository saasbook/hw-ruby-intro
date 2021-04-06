#!/bin/bash

source ./.github/CHIPS-config.sh
if ! [[ `git -c user.name="GitHub Actions" -c user.email="actions@github.com" subtree pull --prefix .github/workflows/ https://github.com/saasbook/chips_github_workflows.git master --squash 2>&1` = *"Subtree is already at commit"* ]]; then
    echo "Detected changes in upstream workflow repository. Pulling and restarting workflow."
    git push origin master
    exit
fi

git checkout -b starter-code

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

git remote add student-facing ${not_ci_repo_ssh}

git fetch --unshallow student-facing

if [[ `git branch -r 2>&1` = *student-facing/master* ]]; then
    PUSH_OPT=""
else
    echo "No master branch found on student-facing repository, so specifying upstream option."
    PUSH_OPT="-u"
fi

git push -f ${PUSH_OPT} student-facing starter-code:master

git checkout master

if [[ `git branch 2>&1` = *codio* ]]; then
    echo "Clobbering existing Codio branch."
    git branch -d codio
fi

git checkout -b codio

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

if [[ `git branch -r 2>&1` = *origin/codio* ]]; then
    PUSH_OPT=""
else
    echo "No codio branch found on upstream -ci repo, so specifying -u option."
    PUSH_OPT="-u"
fi

git push -f ${PUSH_OPT} origin codio

