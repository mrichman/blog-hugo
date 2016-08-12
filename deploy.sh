#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Try:
# git submodule add -f -b master https://github.com/mrichman/mrichman.github.io.git public

# $ rm -rf public/
# git submodule add -f -b master https://github.com/mrichman/mrichman.github.io.git public
# 'public' already exists in the index
#
# You have to unstage the rack directory first. Then you can add the submodule:
#
# $ git rm -r public
# $ git submodule add -f -b master https://github.com/mrichman/mrichman.github.io.git public

# Build the project.
hugo # if using a theme, replace by `hugo -t <yourtheme>`

# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back
cd ..