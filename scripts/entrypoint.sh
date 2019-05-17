#!/bin/sh

# When we get killed, kill all our children
trap "exit" INT TERM
trap "kill 0" EXIT

# Start up nginx, save PID so we can reload config inside of run_certbot.sh
nginx -g "daemon off;" &
export NGINX_PID=$!

while [ true ]; do
    echo "Reloading"

    kill -HUP $NGINX_PID

    echo "Sleeping"

    # Sleep for 1 week
    sleep 24h &
    SLEEP_PID=$!

    echo "Waiting $SLEEP_PID"

    # Wait on sleep so that when we get ctrl-c'ed it kills everything due to our trap
    wait "$SLEEP_PID"

    echo "Ctrl-C received, exiting"
done

