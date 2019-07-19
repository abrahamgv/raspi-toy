#!/bin/bash
createSSHJump() {
  /usr/bin/ssh -fN -R $REMOTE_IP:$REMOTE_PORT:localhost:22 -i $USER_DIR/ssh-key.pem $REMOTE_USER@$REMOTE_IP

  if [[ $? -eq 0 ]]; then
    echo Tunnel to jumpbox created successfully
  else
    echo An error occurred creating a tunnel to jumpbox. RC was $?
  fi
}
/bin/pidof ssh
if [[ $? -ne 0 ]]; then
  echo Creating new tunnel connection
  createSSHJump
fi

