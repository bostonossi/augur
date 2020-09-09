#!/bin/bash
set -euo pipefail

function install_deps() {

    if [[ $(command -V npm) ]]; then
    cd frontend/;
    echo "Installing frontend dependencies..."
    echo "**********************************"
    echo
    npm install;
    npm install brunch canvas vega @vue/cli;
    npm run build; 
    cd ../;
    echo "Done!"
    else
    echo
    echo "** npm not found. Please install NPM by either installing node (https://nodejs.org/en/download/) or by installing NPM itself."
    echo
    exit 1
    fi
}

read -r -p "Would you like to install Augur's frontend dependencies? [Y/n] " response
case "$response" in
  [yY][eE][sS]|[yY]) 
    echo "Installing..."

    if [[ ! -d logs/install ]]; then
    mkdir logs/install
    fi

    install_deps > logs/install/frontend.log 2>&1
    echo "Done!"
    ;;
  *)
    echo "Skipping frontend dependencies..."
    ;;
esac

