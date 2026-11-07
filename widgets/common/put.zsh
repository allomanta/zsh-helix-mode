# Start and end (exclusive) of the selection, forward ones include the cursor
_hx-selection-range() {
  if (( MARK <= CURSOR )); then
    reply=($MARK $(( CURSOR + 1 )))
  else
    reply=($CURSOR $MARK)
  fi
  (( reply[2] > ${#BUFFER} )) && reply[2]=${#BUFFER}
}

# Replace the text from $1 to $2 with $3 and select it
_hx-put() {
  [[ -n $3 ]] || return
  BUFFER=${BUFFER:0:$1}$3${BUFFER:$2}
  MARK=$1
  CURSOR=$(( $1 + ${#3} - 1 ))
  REGION_ACTIVE=1
}
