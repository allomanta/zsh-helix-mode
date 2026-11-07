_hx-join() {
  # Join the lines of the selection, or the next line onto this one
  local reply buf=$BUFFER mark=$MARK cursor=$CURSOR a b i sep pos
  local -a joins
  _hx-selection-range
  for (( i = reply[1]; i < reply[2] - 1; i++ )); do
    [[ ${buf:$i:1} == $'\n' ]] && joins+=($i)
  done
  if (( ! $#joins )); then
    for (( i = reply[2] > reply[1] ? reply[2] - 1 : reply[1]; i < ${#buf}; i++ )); do
      if [[ ${buf:$i:1} == $'\n' ]]; then
        joins=($i)
        break
      fi
    done
  fi
  # From the back, so the earlier positions stay valid
  for a in ${(Oa)joins}; do
    b=$(( a + 1 ))
    while [[ ${buf:$b:1} == [[:blank:]] ]]; do
      (( ++b ))
    done
    # Lines with only blanks are joined without a space
    if [[ ${buf:$b:1} == ($'\n'|) ]]; then
      sep=
    else
      sep=' '
    fi
    buf=${buf:0:$a}$sep${buf:$b}
    for pos in mark cursor; do
      if (( $pos >= b )); then
        (( $pos += ${#sep} - (b - a) ))
      elif (( $pos > a )); then
        (( $pos = a ))
      fi
    done
  done
  BUFFER=$buf MARK=$mark CURSOR=$cursor REGION_ACTIVE=1
}
zle -N _hx-join
