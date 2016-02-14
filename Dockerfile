FROM ubuntu:14.04
MAINTAINER Bill Agee <billagee@gmail.com>

# Install the phantomjs browser, Python, and the Python Selenium bindings
RUN apt-get update && apt-get install -y \
        phantomjs \
        python2.7 \
        python-pip \
        && pip install selenium

# Run a Ghostdriver demo script
ENV my_test_script=google-search-test.py
COPY ${my_test_script} /
CMD "/${my_test_script}"

