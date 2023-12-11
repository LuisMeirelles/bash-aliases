for file in ~/.bash_aliases.d/*_alias.sh; do
  # shellcheck source=/dev/null
  [ -r "$file" ] && source "$file"
done
