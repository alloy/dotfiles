function pathcopy -d "Copy the expanded path to the OS X pasteboard"
  switch $argv
    case '/*'
      set path $argv
    case '*'
      set path (pwd)/$argv
  end
  echo -n $path | pbcopy
end
