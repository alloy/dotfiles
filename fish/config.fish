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
set SHELL (which sh)

set -x EDITOR "mvim -f"

function -d "Open the working directory with mvim" m
  mvim .
end


### rbenv

set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1
