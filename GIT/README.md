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

## Remote

```bash
# Change the remote URL
git remote set-url origin ssh://[user]@[hostname]/[path to repository]

# List remote URL's
git remote -v
```