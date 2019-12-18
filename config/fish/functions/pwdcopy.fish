function pwdcopy -d "Copy the current working-dir path to the OS X pasteboard"
  echo -n (pwd) | pbcopy
end
