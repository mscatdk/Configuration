# GIT

## Config

```bash
# If false, the executable bit differences between the index and the working copy are ignored; useful on broken filesystems like FAT.
git config core.fileMode false
```

## Checkout

```bash
# Checkout branch
git checkout -b [branch name]

# Checkout tag
git checkout tags/[tag name] -b [branch name]
```

## branch

```bash
# Create tag from branch
git branch branchname [sha1-of-commit]

# Delete local branch
git branch -d [branch_name]

# Force delete local branch
git branch -D [branch_name]

# Delete remote branch
git push [remote_name] --delete [branch_name]
```

## Tag

```bash
# Create tag
git tag [tag name]

# Push tag to remote
git push origin --tags

# Delete tag
git push --delete origin [tag name]
```

## Remote

```bash
# Change the remote URL
git remote set-url origin ssh://[user]@[hostname]/[path to repository]

# List remote URL's
git remote -v
```

## Merge

````bash
git merge -Xignore-space-change
````
