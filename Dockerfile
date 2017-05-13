FROM ubuntu

RUN apt-get update && apt-get install -y git curl build-essential libncurses5-dev libx11-dev

RUN mkdir /chez
WORKDIR /chez

ADD bintar /chez/bintar
ADD boot /chez/boot
ADD c /chez/c
ADD configure /chez/configure
ADD csug /chez/csug
ADD makefiles /chez/makefiles
ADD mats /chez/mats
ADD nanopass /chez/nanopass
ADD s /chez/s
ADD stex /chez/stex
ADD scheme.1.in /chez/scheme.1.in
ADD workarea /chez/workarea
ADD newrelease /chez/newrelease
ADD checkin /chez/checkin
ADD zlib /chez/zlib
ADD examples /chez/examples
ADD unicode /chez/unicode

RUN ./configure
RUN make -j2 install

ENTRYPOINT ["/usr/bin/scheme"]
