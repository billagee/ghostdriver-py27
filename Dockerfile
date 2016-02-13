# VERSION:        0.1
# DESCRIPTION:    Run a Python Ghostdriver demo script in a container
# AUTHOR:         Bill Agee <billagee@gmail.com>
# COMMENTS:
#   This file describes how to build a container capable of running
#   Ghostdriver tests with Python 2.7 and the Selenium Python bindings.
#   A build of PhantomJS is included unless you bring your own.
#   Tested on OS X 10.11
# USAGE:
#   # If desired, you may download an alternate phantomjs build from the
#   # bitbucket URL below, and bundle it into the Docker image by placing
#   # the extracted phantomjs binary in the same dir as this Dockerfile:
#
#   https://bitbucket.org/ariya/phantomjs/downloads
#
#   # Build image
#   ./build_image.sh
#
#   # Run container
#   ./run_container.sh
#
#   # Get an interactive shell in a container
#   ./shell.sh

FROM ubuntu:14.04
MAINTAINER Bill Agee <billagee@gmail.com>
RUN apt-get update && apt-get install -y \
        python2.7 python-pip fontconfig \
        && pip install selenium
COPY phantomjs /usr/local/bin/phantomjs
COPY google-search-test.py /google-search-test.py

CMD [ "python", "google-search-test.py" ]

