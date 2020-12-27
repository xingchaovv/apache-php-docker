#!/bin/bash

runUid=33; if [ -n "$RUN_UID" ]; then runUid=$RUN_UID; fi
runGid=33; if [ -n "$RUN_GID" ]; then runGid=$RUN_GID; fi

runGroup=app
# Not existed group
if [ -z "$(getent group "$runGroup")" ]; then
  groupForRunGid=$(getent group "$runGid" | awk -F: '{print $1}')
  if [ -z "$groupForRunGid" ]; then
    groupadd -g "$runGid" "$runGroup"
  else
    runGroup=$groupForRunGid
  fi
fi

runUser=app
# Not existed user
if ! id "$runUser"; then
  if ! id "$runUid"; then
    useradd -u "$runUid" -g "$runGroup" -m $runUser
  else
    runUser=$(id -un "$runUid")
  fi
fi

export APACHE_RUN_USER=$runUser
export APACHE_RUN_GROUP=$runGroup
