# delete all tags
git tag -d $(git tag -l)
git fetch
git push origin --delete $(git tag -l)
git tag -d $(git tag -l)

git fetch
git tag -l | xargs -n 1 git push --delete origin

# commit and push reset
#git add .
#git commit -m "chore: reset monorepo"
#git push


# RESET COMMITS
# Check out to a temporary branch:
git checkout --orphan TEMP_BRANCH
# Add all the files:
git add -A
# Commit the changes:
git commit -am "chore: initial commit"
# Delete the old branch:
git branch -D master
# Rename the temporary branch to master:
git branch -m master
# Finally, force update to our repository:
git push -f origin master
git branch --set-upstream-to=origin/master
