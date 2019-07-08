#!/bin/bash

mkdir -vp /etc/ezstream
mv -v /app/icecast.xml /etc/icecast2/icecast.xml
mv -v /app/stream.xml /etc/ezstream/stream.xml

# Start Icecast
icecast2 -c /etc/icecast2/icecast.xml &

# Required sleep for icecast2 to figure itself out
sleep 2

# Tune to FM 91.1 Mhz; 180k sample rate
RTL_ARGS="-f 91.1M -M fm -s 180k -A fast -l 0 -p 100 -g 20"

# Transcode output to 180k vorbis
SOX_ARGS="-r 180k -t raw -e signed -b 16 -c 1 -V1 -v 2.2  - -r 180k -t vorbis - sinc 0-15k -t 1000"

rtl_fm ${RTL_ARGS} | sox ${SOX_ARGS} | ezstream -c /etc/ezstream/stream.xml

