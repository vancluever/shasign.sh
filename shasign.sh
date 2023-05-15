#!/usr/bin/env bash

# The slug to use (file basename). This is the base for the SHA256SUMS and the
# SHA256SUMS.sig file.
slug="$1"

# message prints text with a color, redirected to stderr in the event of
# warning or error messages.
message() {
  declare -A __colors=(
    ["error"]="31"   # red
    ["warning"]="33" # yellow
    ["begin"]="32"   # green
    ["ok"]="32"      # green
    ["info"]="1"     # bold
    ["reset"]="0"    # here just to note reset code
  )
  local __type="$1"
  local __message="$2"
  if [ -z "${__colors[$__type]}" ]; then
    __type="info"
  fi
  if [[ ! "${__type}" =~ ^(warning|error)$ ]]; then
    echo -e "\e[${__colors[$__type]}m${__message}\e[0m" 1>&2
  else
    echo -e "\e[${__colors[$__type]}m${__message}\e[0m"
  fi
}

sumfile="${slug}_SHA256SUMS"
sigfile="${slug}_SHA256SUMS.sig"

if [ -f "${sumfile}" ]; then
  message begin "==> Removing stale sum file ${sumfile} <=="
  rm "${sumfile}"
fi
if [ -f "${sigfile}" ]; then
  message begin "==> Removing stale signature file ${sigfile} <=="
  rm "${sigfile}"
fi

message begin "==> Generating ${sumfile} from files in ${$1} <=="
sha256sum $1/* >> ${sumfile}
sed -i "s|$1/||g" ${sumfile};

message begin "==> Signing ${sumfile} and generating signature in ${sigfile} <=="
gpg --output "${sigfile}" --detach-sig "${sumfile}"

message ok "Signing data successful."
