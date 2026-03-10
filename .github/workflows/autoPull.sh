# Basc Script to Pull New Update from the rep

git config --global user.name "Shubhamharanale7"
git config --global user.email "Shubhamharanale7@gmail.com"
# Set GITHUB_TOKEN environment variable
git config --global user.password "$GITHUB_TOKEN"
git config credential.helper store

git status
git pull
echo 'Pleas Wait , Loading files from github...'
read
