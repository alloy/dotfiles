set git_dirty red
set git_clean cyan
set git_uncommitted magenta


function -d "Return true if this is a git repository." is-git
  if git rev-parse --is-inside-work-tree > /dev/null ^ /dev/null
    return 0
  else
    return 1
  end
end


function -d "set_color to git_clean, git_dirty, or git_uncommitted, depending." set-git-color
  if git diff --quiet
    if git diff --staged --quiet
      set_color $git_clean
    else
      set_color $git_uncommitted
    end
  else
    set_color $git_dirty
  end
end
