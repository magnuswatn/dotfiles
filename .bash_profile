# .bash_profile

# User specific environment and startup programs
export PATH=$PATH:$HOME/.local/bin:$HOME/bin

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for personal settings
for file in ~/.{bashrc,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Long paths are yucky
PROMPT_DIRTRIM=1

if [ -z "$SSH_AUTH_SOCK" ]; then
   # Check for a currently running instance of the agent
   RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
   if [ "$RUNNING_AGENT" = "0" ]; then
        # Launch a new instance of the agent
        ssh-agent -s &> .ssh/ssh-agent
   fi
   eval `cat .ssh/ssh-agent`
fi
