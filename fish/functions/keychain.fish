function keychain-account -d "Retrieve the account part of a Keychain item based on the name of the item."
  if count $argv > /dev/null
    security find-generic-password -s $argv[1] | grep '"acct"' | sed 's/^.*="\(.*\)"$/\1/'
  else
    echo "Specify the name of the Keychain password item."
  end
end

function keychain-password -d "Retrieve the password part of a Keychain item based on the name of the item."
  if count $argv > /dev/null
    security find-generic-password -s $argv[1] -w
  else
    echo "Specify the name of the Keychain password item."
  end
end
