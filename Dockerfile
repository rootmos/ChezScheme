FROM alpine:3.4

RUN mkdir /chez
WORKDIR /chez

RUN apk update && apk add git curl build-base ncurses ncurses-dev libx11-dev
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h

ADD . /chez

RUN ./configure
RUN make -j2 install

WORKDIR /
RUN rm -rf /chez
RUN apk del git curl build-base ncurses-dev libx11-dev

ENTRYPOINT ["/usr/bin/scheme"]
