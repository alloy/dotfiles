### fish

set fish_greeting ""

# source all of the files in the function directory
for f in ~/.config/fish/functions/*.fish
  . $f
end


### general

set PATH /opt/local/bin $PATH

# vim and some other things rely on SHELL being a posixy sh this may cause
# problems in the future, in which case I'll define a little function to wrap
# vim and give it a fake environment variable.
set -x SHELL (which sh)

set -x EDITOR "mvim -f"
set -x REACT_EDITOR code

function -d "Open the working directory with mvim" m
  mvim .
end

# Use https://hub.github.com as if it were git
alias git hub

# This env var is used by e.g. the various Podfiles to either pull in OSS or
# closed source libs.
set -x ARTSY_STAFF_MEMBER "1"

### Ruby

source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

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

### Node Version Manager

source ~/.config/fish/nvm-wrapper/nvm.fish
