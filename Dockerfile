FROM robsharp/rpi-sickrage
MAINTAINER Shivneil Prasad <sprasad0603@gmail.com>

# Create volumes for post-processing directories, tvshows, and sickrage data
RUN mkdir -p /data/completed_downloads /data/tvshows /opt/SickRage/data
# Copy over config.ini with initial configuration to work with transmission 
# BEFORE making it a volume to make sure it actually takes effect
COPY config.ini /opt/SickRage/data
VOLUME /data/completed_downloads /data/tvshows /opt/SickRage/data

ENTRYPOINT ["python", "/opt/SickRage/SickBeard.py", "--nolaunch", "--datadir=/opt/SickRage/data"]
