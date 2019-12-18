function clean_file -d "Replaces tabs by two spaces and removes trailing whitespace"
  set file $argv[1]
  expand -t 2 "$file" | sed 's/ \{1,\}$//' > "$file.tmp"
  mv "$file.tmp" "$file"
end
