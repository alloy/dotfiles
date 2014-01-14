function pathcopy -d "Copy the expanded path to the OS X pasteboard"
  echo -n $argv | pbcopy
end
