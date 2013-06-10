# Finds a directory in my Code directory with partial matches.
function wo
  set -l code_dir ~/Code
  cd (find $code_dir -type d -maxdepth 3 | grep -i $argv | grep -Ev Pods --max-count=1)
end
