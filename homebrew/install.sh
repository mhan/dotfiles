#!/usr/bin/env bash
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if [ "$(uname -s)" == "Darwin" ]; then
    if test ! $(which brew)
    then
      echo "  Installing Homebrew for you."
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    # Install homebrew packages
    brew install grc coreutils spark git ack vim
fi
exit 0
