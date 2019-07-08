# SDR-Icecast

Transcode and stream audio from a software defined radio (like a RTL2838) to Icecast.

### Software

* icecast2
* ezstream
* sox
* rtl_fm


### Requirements

    docker
    docker-compose
    text exitor

### Installation

Transcoding is handled in the `entrypoint.sh` file.  In this file you can modify which frequency to tune the SDR (hint default is 91.1M).

Check out this article http://kmkeen.com/rtl-demod-guide/ then update entrypoint.sh - unless you really enjoy 91.1FM

Clone this repository into a directory, enter the directory and execute :

    cp stream.sample.xml stream.xml
    cp icecast.sample.xml icecast.xml

    # IMPORTANT : Edit these files and at least change the default password (search 'hackme')

    docker-compose build
    docker-compose up


