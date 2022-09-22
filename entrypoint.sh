#! /bin/bash
set -e

# Remove an existing pid file, if it exists
rm -f /myapp/tmp/pids/server.pid

# Exec the container's main process (See CMD in the Dockerfile)
exec "$@"