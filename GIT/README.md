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

## Tag

```bash
# Create tag
git tag [tag name]

# Push tag to remote
git push origin --tags
```

## Remote

```bash
# Change the remote URL
git remote set-url origin ssh://[user]@[hostname]/[path to repository]

# List remote URL's
git remote -v
```