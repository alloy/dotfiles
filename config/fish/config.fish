### fish

set fish_greeting ""

# source all of the files in the function directory
for f in ~/.config/fish/functions/*.fish
  . $f
end

### Homebrew

if test -d /home/linuxbrew/.linuxbrew
  # linux
  set -x BREW_HOME "/home/linuxbrew/.linuxbrew"
else
  # macOS
  set -x BREW_HOME "/usr/local"
end

set PATH $BREW_HOME/bin $PATH

### general

# Windows adds an entry to the path that contains parentheses, but nvm-wrapper
# doesn't escape those.
# FIXME: Switch to `bass` from `nvm-wrapper`
if set -l remove_from_path_index (contains -i -- "/mnt/c/Program Files (x86)" $PATH)
  set -e $PATH[$remove_from_path_index]
end

# vim and some other things rely on SHELL being a posixy sh this may cause
# problems in the future, in which case I'll define a little function to wrap
# vim and give it a fake environment variable.
set -x SHELL (which sh)

set -x EDITOR "code -w"
set -x REACT_EDITOR code

# This env var is used by e.g. the various Podfiles to either pull in OSS or
# closed source libs.
set -x ARTSY_STAFF_MEMBER "1"

### Ruby

source $BREW_HOME/share/chruby/chruby.fish
source $BREW_HOME/share/chruby/auto.fish

set -x GEM_HOME $HOME/.gem
set PATH $GEM_HOME/bin $PATH

function be
  bundle exec $argv
end

function bi
  bundle install
end

function bu
  bundle update
end

source ~/.config/fish/credentials.fish

# Use https://hub.github.com as if it were git
eval (hub alias -s)
source $BREW_HOME/share/fish/vendor_completions.d/hub.fish

# Setup Node version manager
source ~/.config/fish/nvm-wrapper/nvm.fish
nvm use default 2>&1 >/dev/null
