CMD="$1"

if [[ -z "$CMD" ]]; then
  echo "Please provide a command to explain"
  exit 1
fi

BASE_CMD=$(echo "$CMD" | awk '{print $1}')

echo "Command : $BASE_CMD"

DESC=$(man "$BASE_CMD" 2>/dev/null | grep -m1 " - " | sed 's/.* - //')

if [[ -n "$DESC" ]]; then
  echo "Meaning : $DESC"
else
  echo "Meaning : Not found"
fi

echo
echo "Arguments:"

for word in $CMD; do
  case "$word" in
    -r) echo "  -r → recursive";;
    -f) echo "  -f → force";;
    -a) echo "  -a → all";;
    -l) echo "  -l → long format";;
    777|755|644) echo "  $word → permission mode";;
    *)
      [[ "$word" != "$BASE_CMD" ]] && echo "  $word → argument"
      ;;
  esac
done
