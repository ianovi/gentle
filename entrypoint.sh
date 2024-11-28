#!/bin/bash

APP_PATH="/gentle"
INITIALIZATION_FLAG="$APP_PATH/.initialized"
SETUP_SCRIPT="$APP_PATH/setup.sh"
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
fi

# shellcheck disable=SC2164
cd "$APP_PATH"
source ./venv/bin/activate
echo "Running default CMD from Dockerfile..."
# shellcheck disable=SC2068
exec $@
