# .bash_profile

# User specific environment and startup programs
export PATH=$PATH:$HOME/.local/bin:$HOME/bin

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for personal settings
for file in ~/.{bashrc,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Add tab completion for pipenv
if which pipenv &> /dev/null; then
  eval "$(pipenv --completion)"
fi;
