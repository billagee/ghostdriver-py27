#!/bin/sh

# If a phantomjs binary is found in the current dir, go straight
# to the image build step, but if one isn't present, extract the
# default phantomjs release included with this script.
if [ ! -f phantomjs ]; then
    DEFAULT_PHANTOMJS_RELEASE=phantomjs-2.1.1-linux-x86_64
    echo "Extracting $DEFAULT_PHANTOMJS_RELEASE for use in your image..."
    tar zxf $DEFAULT_PHANTOMJS_RELEASE.tar.bz2
    cp $DEFAULT_PHANTOMJS_RELEASE/bin/phantomjs .
    rm -rf $DEFAULT_PHANTOMJS_RELEASE
fi

docker build -t billagee/ghostdriver-py27 .

