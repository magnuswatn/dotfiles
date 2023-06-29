export PATH=$HOME/.local/bin:$PATH

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for personal settings
for file in ~/.{aliases,functions,exports,extra}; do
  [ -r "${file}" ] && [ -f "${file}" ] && source "${file}";
done;
unset file;

if command -v brew &> /dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# oh-my-zsh config
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git docker docker-compose)
source $ZSH/oh-my-zsh.sh

# zsh options
unsetopt share_history

# tab autocomplete
if command -v pipx &> /dev/null; then
  eval "$(register-python-argcomplete pipx)"
fi;

if command -v kubectl &> /dev/null; then
  source <(kubectl completion zsh)
fi;

if command -v certpeek &> /dev/null; then
  eval "$(_CERTPEEK_COMPLETE=zsh_source certpeek)"
fi;

if command -v pipenv &> /dev/null; then
  eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"
fi

if command -v hatch &> /dev/null; then
  eval "$(_HATCH_COMPLETE=zsh_source hatch)"
fi

if command -v gh &> /dev/null; then
  source <(gh completion -s zsh)
  compdef _gh gh
fi

# ssh agent
if [[ -z "${SSH_AUTH_SOCK}" ]]; then
   # Check for a currently running instance of the agent
   RUNNING_AGENT="$(pgrep -cf 'ssh-agent -s')"
   if [[ "${RUNNING_AGENT}" = "0" ]]; then
        # Launch a new instance of the agent
        ssh-agent -s &> "${HOME}/.ssh/ssh-agent"
   fi
   eval "$(cat "${HOME}/.ssh/ssh-agent")"
fi
