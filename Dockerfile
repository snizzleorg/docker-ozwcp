FROM resin/rpi-raspbian
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install --no-install-recommends -y nano
RUN apt-get install --no-install-recommends -y libmicrohttpd-dev
RUN apt-get install --no-install-recommends -y git
RUN apt-get install --no-install-recommends -y ca-certificates

RUN git clone https://github.com/OpenZwave/open-zwave-control-panel
RUN git clone https://github.com/OpenZWave/open-zwave open-zwave-read-only

RUN apt-get install --no-install-recommends -y build-essential
RUN apt-get install --no-install-recommends -y libudev-dev

RUN cd open-zwave-read-only && make && make install

RUN apt-get install --no-install-recommends -y libgnutls28-dev

COPY Makefile /open-zwave-control-panel/Makefile

RUN cd open-zwave-control-panel && make

#COPY options.xml /usr/local/etc/openzwave/options.xml

WORKDIR /open-zwave-control-panel

CMD ./ozwcp -d -p 8008
