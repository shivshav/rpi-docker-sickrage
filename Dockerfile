FROM robsharp/rpi-sickrage
MAINTAINER Shivneil Prasad <sprasad0603@gmail.com>

# Create volumes for post-processing directories, tvshows, and sickrage data
RUN mkdir -p /data/completed_downloads /data/tvshows /opt/SickRage/data
# Copy over config.ini with initial configuration to work with transmission 
# BEFORE making it a volume to make sure it actually takes effect
# Unfortunately, initial volume data does not populate on a bind-mount (i.e. -v
# <some host dir>:<container-src>), only on named volumes
#COPY config.ini /opt/SickRage/data
VOLUME /data/completed_downloads /data/tvshows /opt/SickRage/data

COPY sickrage-start.sh first-run.sh config.ini.template /

ENTRYPOINT ["/sickrage-start.sh"]
