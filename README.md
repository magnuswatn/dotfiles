My personal dotfiles. Not much to see here...

All the clever stuff is taken from [Jess Frazelle](https://github.com/jessfraz/dotfiles).

**To install:**

```console
$ make
```

This will create symlinks from this repo to your home folder.

**To customize:**

Save env vars, etc in a `.extra` file, that looks something like this:

```bash
###
### Git credentials
###

export GIT_AUTHOR_NAME="Your name"
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
export GIT_AUTHOR_EMAIL="your@email.no"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
export JJ_USER="Your name"
export JJ_EMAIL="your@email.no"

###
### Proxy config
###

PROXY="http://localhost:8080"
```
