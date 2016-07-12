#!/bin/bash

CONFIG=config.ini
CONFIG_DIR=/opt/SickRage/data
OVERWRITE_CONFIG=${OVERWRITE_CONFIG:-false}

TRAKT_LIST=${TRAKT_LIST:-watchlist}

if [[ -z "$TR_USERNAME" || -z "$TR_PASSWORD" ]]; then
    echo "No values given for transmission and trakt access. Recommend recreating container with '\$TR_USERNAME', '\$TR_PASSWORD' environment variables set."
    exit 1
fi

# Check for presence of a config file
if [[ ! -f $CONFIG_DIR/$CONFIG || "$OVERWRITE_CONFIG" = true ]]; then
    cp /${CONFIG}.template $CONFIG_DIR/$CONFIG

    # Transmission intercommunication parameters
    sed -i "s/{{TR_USERNAME}}/${TR_USERNAME}/g" $CONFIG_DIR/$CONFIG
    sed -i "s/{{TR_PASSWORD}}/${TR_PASSWORD}/g" $CONFIG_DIR/$CONFIG
    # Sickrage web user configuration
    sed -i "s/{{SR_USERNAME}}/${SR_USERNAME}/g" $CONFIG_DIR/$CONFIG
    sed -i "s/{{SR_PASSWORD}}/${SR_PASSWORD}/g" $CONFIG_DIR/$CONFIG
else
    echo "Current settings file will not be overwritten."
fi

#sed -i "s/{{TR_USERNAME}}/${TR_USERNAME}/g" ${CONFIG}
#sed -i "s/{{TR_PASSWORD}}/${TR_PASSWORD}/g" ${CONFIG}
#sed -i "s/{{TRAKT_ACCOUNT}}/${TRAKT_ACCOUNT}/g" ${CONFIG}
#sed -i "s/{{TRAKT_LIST}}/${TRAKT_LIST}/g" ${CONFIG}

echo "Initial setup finished"
rm /first-run.sh
