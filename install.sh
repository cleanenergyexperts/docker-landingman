#!/bin/bash -e

echo "================= Installing... ================="

mkdir -p /tmp
chmod 1777 /tmp

echo "================= Updating Apt-get ==================="
apt-add-repository -y ppa:brightbox/ruby-ng
add-apt-repository -y ppa:chris-lea/node.js
add-apt-repository -y ppa:danmbox/ppa
apt-get -y update

echo "================= Ruby Version ==================="
apt-get -y install ruby2.2 ruby2.2-dev
gem install bundler

echo "================= Install NodeJS ==================="
apt-get -y install nodejs
npm install -g svgo

echo "================= Install Dependencies ==================="
apt-get -y install \
	libpng-dev \
	libxml2 \
	libxml2-dev \
	libxslt1-dev \
	libssl-dev \
	g++ \
	zlib1g-dev \
	checkinstall

echo "================= Install optipng and pngcrush ===================" 
apt-get -y install advancecomp gifsicle jhead jpegoptim libjpeg-progs optipng pngcrush pngquant

echo "================= Install PNGOUT ==================="
wget http://static.jonof.id.au/dl/kenutils/pngout-20130221-linux.tar.gz
tar xvzf pngout-20130221-linux.tar.gz
mv pngout-20130221-linux/x86_64/pngout /usr/local/bin/
rm -rf pngout-20130221-linux
rm pngout-20130221-linux.tar.gz

echo "================= Install ImageMagick ==================="
apt-get build-dep -y imagemagick
apt-get install -y libmagickwand-dev libmagickcore-dev libmagickcore-extra libgraphviz-dev
wget http://www.imagemagick.org/download/ImageMagick.tar.gz
mkdir ImageMagick
tar -xzvf ImageMagick.tar.gz -C ImageMagick --strip-components=1
cd ImageMagick
./configure
make
make install
ldconfig /usr/local/lib
cd ..
rm -rf ImageMagick
rm ImageMagick.tar.gz

# echo "================= Install PhantomJS 1.9.8 ==================="
# wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.8-linux-x86_64.tar.bz2
# tar -vxjf phantomjs-1.9.8-linux-x86_64.tar.bz2
# mv phantomjs-1.9.8-linux-x86_64/bin/phantomjs /usr/local/bin/
# rm phantomjs-1.9.8-linux-x86_64.tar.bz2
# rm -rf phantomjs-1.9.8-linux-x86_64

echo "================= Install qt & Xvfb ==================="
apt-get -y install libqtwebkit-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x
apt-get -y install xvfb x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic

echo "================= Cleaning package lists ==================="
apt-get clean
apt-get autoclean
apt-get autoremove
exit 0;