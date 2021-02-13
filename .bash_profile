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
