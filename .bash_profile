#!/bin/bash
# .bash_profile

# User specific environment and startup programs
export PATH=$PATH:$HOME/.local/bin:$HOME/bin

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for personal settings
for file in ~/.{bashrc,aliases,functions,exports,extra}; do
  [ -r "${file}" ] && [ -f "${file}" ] && source "${file}";
done;
unset file;

# Add tab completion for kubectl
if command -v kubectl &> /dev/null; then
  source <(kubectl completion bash)
fi;

if command -v certpeek &> /dev/null; then
  eval "$(_CERTPEEK_COMPLETE=source_bash certpeek)"
fi;

# Long paths are yucky
PROMPT_DIRTRIM=1

if [[ -z "${MAGNUS_BEHOLD_PROMPT}" ]]; then
  PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

if [[ -z "${SSH_AUTH_SOCK}" ]]; then
   # Check for a currently running instance of the agent
   RUNNING_AGENT="$(pgrep -cf 'ssh-agent -s')"
   if [[ "${RUNNING_AGENT}" = "0" ]]; then
        # Launch a new instance of the agent
        ssh-agent -s &> "${HOME}/.ssh/ssh-agent"
   fi
   eval "$(cat "${HOME}/.ssh/ssh-agent")"
fi
