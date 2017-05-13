FROM ubuntu

RUN apt-get update && apt-get install -y git curl build-essential libncurses5-dev libx11-dev

RUN mkdir /chez
WORKDIR /chez

ADD . /chez

RUN ./configure
RUN make -j2 install

ENTRYPOINT ["/usr/bin/scheme"]
