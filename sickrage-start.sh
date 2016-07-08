#!/bin/bash

set -e

FIRST_RUN=first-run.sh
if [[ -x /$FIRST_RUN ]]; then
    /$FIRST_RUN
fi

echo "Start up SickRage."

exec su -s /bin/bash -c "python /opt/SickRage/SickBeard.py --nolaunch --datadir=/opt/SickRage/data"
