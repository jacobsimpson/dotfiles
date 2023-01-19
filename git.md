

git branch -r --contains $(git branch --show-current)
- does the branch exist on the remote server.

git push --set-upstream origin $(git branch --show-current)
- push this branch to the remote server.

gh pr create --fill
- Make a PR.
