# Return id of process listening on a port
onport() {
  lsof -i4TCP:$1 | tail +2 | awk {'print $2'}
}

# Kill process listening on a port
killonport() {
  kill `onport $1`
}

