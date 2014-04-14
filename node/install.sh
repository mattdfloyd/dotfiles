#!/bin/sh

if test ! $(which nvm)
then
  echo "  Installing nvm for you."
  brew install node > /tmp/node-install.log
  curl https://raw.github.com/creationix/nvm/v0.4.0/install.sh | sh > /tmp/rbenv-install.log
fi
