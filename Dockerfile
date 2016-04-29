FROM drydock/u14:prod
MAINTAINER Matt Snider (matt@cleanenergyexperts.com)

RUN mkdir -p /tmp && chmod 1777 /tmp
RUN apt-add-repository -y ppa:brightbox/ruby-ng
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN add-apt-repository -y ppa:danmbox/ppa
RUN apt-get -y update

RUN apt-get -y install ruby2.2 ruby2.2-dev
RUN gem install bundler

RUN apt-get -y install nodejs
RUN npm install -g svgo

RUN apt-get -y install \
	libpng-dev \
	libxml2 \
	libxml2-dev \
	libxslt1-dev \
	libssl-dev \
	g++ \
	zlib1g-dev \
	checkinstall

RUN apt-get -y install advancecomp gifsicle jhead jpegoptim libjpeg-progs optipng pngcrush pngquant

RUN wget http://static.jonof.id.au/dl/kenutils/pngout-20130221-linux.tar.gz
RUN tar xvzf pngout-20130221-linux.tar.gz
RUN mv pngout-20130221-linux/x86_64/pngout /usr/local/bin/
RUN rm -rf pngout-20130221-linux
RUN rm pngout-20130221-linux.tar.gz

RUN apt-get build-dep -y imagemagick
RUN apt-get install -y libmagickwand-dev libmagickcore-dev libmagickcore-extra libgraphviz-dev
RUN wget http://www.imagemagick.org/download/ImageMagick.tar.gz && \
	mkdir ImageMagick && \
	tar -xzvf ImageMagick.tar.gz -C ImageMagick --strip-components=1 && \
	cd ImageMagick && \
	./configure && \
	make && \
	make install && \
	ldconfig /usr/local/lib

RUN apt-get -y install libqtwebkit-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x
RUN apt-get -y install xvfb x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic