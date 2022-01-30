function whatismyip {
  curl -sL http://ipconfig.me/ip
}

function isitup {
  if [ -z "$1" ] ; then
    echo "Usage: isitup URL"
    return
  fi

  curl -sL "http://isitup.org/${1}.json"
  echo
}
