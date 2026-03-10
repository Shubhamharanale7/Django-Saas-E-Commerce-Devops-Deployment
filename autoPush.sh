git config --global user.name "Shubhamharanale7"
git config --global user.email "Shubhamharanale7@gmail.com"
# Set GITHUB_TOKEN environment variable
git config --global user.password "$GITHUB_TOKEN"
git config credential.helper store

git status
git add .
echo 'Enter the commit message:'
# shellcheck disable=SC2162
read commitMessage

git commit -m "$commitMessage"

#echo 'Enter the name of the branch:'
#read branch

#git push origin $branch
git push origin main

read
