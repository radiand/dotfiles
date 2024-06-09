# dotfiles

My configuration files managed as a git bare repository (see
[article](https://www.atlassian.com/git/tutorials/dotfiles)).

## Usage

```bash
cd ~
git init
git remote add origin <this repo URL>
git fetch
git checkout -f master
```

## Requirements

### git

`.gitconfig` expects and imports `.gitidentity` file where I define my git
credentials to be used on some particular machine. `.gitidentity` should look
like:

```ini
[user]
    email="mail@domain.url"
    name="user"
```
