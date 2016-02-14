.PHONY: all build run clean

all: run

build:
	docker build --rm --force-rm -t billagee/ghostdriver-py27 .

run: build
	docker run --rm billagee/ghostdriver-py27

shell: build
	docker run -it --rm billagee/ghostdriver-py27 bash

clean:
	docker rmi billagee/ghostdriver-py27

