# Open editor to create a note and push it to local pushnoted
note() {
  if ! hash pushnote ; then echo >&2 "pushnote not installed. 'gem install pushnote'" ; exit 1 ; fi
  if [[ -z $1 ]] ; then title="Untitled" ; else title=$1 ; fi
  tempfile=~/.pushnote/tempnote.md
  $EDITOR $tempfile
  cat $tempfile | pushnote --title $title
  rm $tempfile
}
