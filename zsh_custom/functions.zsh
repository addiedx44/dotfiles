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

function ssm {
  if [ $# -ne 1 ]; then
    cat <<EOT

usage: $0 ec2-target

ec2-target: the EC2 instance ID or instance Name tag value

If multiple instances share the same Name tag value, only the first will be returned.

EOT

    return
  fi

  INSTANCEID="$1"
  if [[ ! "$INSTANCEID" =~ "^i-[a-f0-9]{8}$" && ! "$INSTANCEID" =~ "^i-[a-f0-9]{17}$" ]] ; then
    INSTANCEID="$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" --query "Reservations[0].Instances[0].InstanceId" --output text)"
    echo $1 $INSTANCEID
  fi

  if [[ -n "$INSTANCEID" ]] ; then
    aws ssm start-session --target $INSTANCEID
  fi
}
