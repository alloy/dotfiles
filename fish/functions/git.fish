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


function -d "set_color to git_clean, git_dirty, or git_uncommitted, depending." git-status-color
  if git diff --quiet
    if git diff --staged --quiet
      printf $git_clean
    else
      printf $git_uncommitted
    end
  else
    printf $git_dirty
  end
end

function -d "returns the current branch name" git-branch
  printf (git rev-parse --abbrev-ref HEAD)
end
