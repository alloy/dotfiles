function with_color -d "set_color to the first argument and pass the rest to echo."
  # set the color to the first argument
  set_color $argv[1]
  # delete that argument
  set -e argv[1]
  # and then pass the rest to echo, so we can do things like
  # `with_color cyan -n hi`.
  echo $argv
  # and then go back to normal
  set_color normal
end


function fish_prompt
  with_color $fish_color_cwd -n (prompt_pwd)

  if is-git
    printf " "
    with_color (git-status-color) -n [(git-branch)]
  end

  printf " » "
end

