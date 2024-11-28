#!/bin/bash

INITIALIZATION_FLAG="/gentle/.initialized"
SETUP_SCRIPT="/gentle/setup.sh"
SLEEP_DURATION=2

if [ ! -f "$INITIALIZATION_FLAG" ]; then
    echo "Running first-time initialization command..."

    while [ ! -f "$SETUP_SCRIPT" ]; do
         echo "Waiting for setup file to be available..."
         sleep $SLEEP_DURATION
    done
    # shellcheck disable=SC1090
    . "$SETUP_SCRIPT"

    touch "$INITIALIZATION_FLAG"
    echo "Initialization complete!"

    exec "$@"
else
    echo "Running default CMD from Dockerfile..."
    exec "$@"
fi
