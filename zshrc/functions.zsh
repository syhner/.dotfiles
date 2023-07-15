function blame() {
  local author=$(flag --short a --long author --default siraj --required --args $@)
  local files=$(flag --short f --long files --default . --args $@)
  local output=$(flag --short o --long output --isboolean --default false --args $@)
  local search=$(flag --short s --long search --args $@)

  local count=0
  while IFS= read -rd '' file ; read -rd '' nr ; read -r line ; do
    if git annotate -p -L "$nr,$nr" -- "$file" | grep -q "$author" ; then
      ((count++))
      if $output ; then
        echo "$file:$nr"
      else
        echo -ne "($count rows)\r"
      fi
    fi
  done < <(git grep -nz "$search" -- "${files[@]}")
  echo "($count rows)"
}

# e.g. local author=$(flag --short a --long author --default siraj --required --args $@)"
function flag() {
  # Set parameters from flags
  while [ "$#" -gt 0 ] && [ "$1" != "--args" ] ; do
    case "${1}" in
      -b|--isboolean) local isboolean=true ;;
      -d|--default) local default="$2" ;;
      -l|--long) local long="$2" ;;
      -s|--short) local short="$2" ;;
      -r|--required) local required=true ;;
    esac

    # Shift twice if there is a flag followed by a value
    if [[ "$2" == \-* ]] ; then
      shift 
    else
      shift 2
    fi
  done

  # Shift the --args argument
  shift

  # Search for the short or long flag in the remaning args
  while [ "$#" -gt 0 ] ; do
    if [ "$1" = "-$short" ] || [ "$1" = "--$long" ] ; then
      if [ "$isboolean" ] ; then
        echo true
        return
      elif [ "$2" = "" ] ; then
        break
      else
        echo "$2"
        return
      fi
    fi
    shift
  done
  if [ -n "$default" ] ; then
    echo "$default"
    return
  fi

  if [ "$required" ] ; then
    if [ -n "$short" ] ; then
      local reqshort="-$short"
    fi
    if [ -n "$long" ] ; then
      local reqlong="--$long"
    fi
    if [ -n "$short" ] && [ -n "$long" ] ; then
      local reqor=" or "
    fi

    echo "The flag $reqshort$reqor$reqlong is required"
    return 1
  fi
}

function gitcd() {
  cd $(git rev-parse --show-toplevel)/$1
}

function gitclonecd() {
  git clone "$1" && cd "$(basename "$_" .git)"
}

function greps() {
  eval grep \""$(join "\|" "$@")"\"
}

function join() {
  local out="$2"
  for i in "${@:3}" ; do
    out+="$1$i"
  done
  echo $out
}

function mkcd() {
  mkdir -p "$@" && cd "$_"
}

function resource() {
  source ~/.zshrc
}

function runinsubdirs() {
  for d in ./*/ ; do 
    (
      cd "$d"
      echo "${PWD##*/} "
      "$@"
    )
  done
}

function setlocaldns() {
  local myip=$(myip)

  echo "Setting dnsmasq config"
  echo "address=/.local/$myip" > /opt/homebrew/etc/dnsmasq.conf

  echo "Restarting dnsmasq (password may be required)"
  sudo brew services restart dnsmasq

  echo "Setting DNS servers to $myip 8.8.8.8..."
  networksetup -setdnsservers Wi-Fi $myip 8.8.8.8

  echo "\nSuccess! You must add $myip as the first DNS server for each additional device."
  echo "Add any .local hostnames to your search domains as required"
}

# usage: zcode [-r] <project name>
function zcode() {
  local reuse=$(flag --short r --long reuse --isboolean --default false --args $@)
  # Write a conditional based on whether reuse is true or false
  if $reuse; then
    eval "z $2 && code -r . && cd -"
  else
  eval "z $1 && code . && cd -"
  fi
}
