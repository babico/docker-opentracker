FROM alpine

MAINTAINER Babico <babico@babico.hol.es>

WORKDIR /tmp

# All-in-One RUN for a very small image size (< 5 MB)
RUN apk add --no-cache gcc g++ make git cvs zlib-dev

RUN cvs -d :pserver:cvs@cvs.fefe.de:/cvs -z9 co libowfat && cd libowfat && make && cd ../ 

RUN git clone git://erdgeist.org/opentracker \
    && cd opentracker \
    && sed -i 's/#FEATURES+=-DWANT_COMPRESSION_GZIP/FEATURES+=-DWANT_COMPRESSION_GZIP/' Makefile \
    && sed -i 's/#FEATURES+=-DWANT_FULLLOG_NETWORKS/FEATURES+=-DWANT_FULLLOG_NETWORKS/' Makefile \
    && make

RUN mv /tmp/opentracker/opentracker /bin/

RUN  apk del gcc g++ make git cvs zlib-dev
RUN  rm -rf /var/cache/apk/* /tmp/* 

COPY ./opentracker.conf /etc/opentracker/opentracker.conf
COPY ./whitelist.txt	/etc/opentracker/whitelist.txt
COPY ./blacklist.txt	/etc/opentracker/blacklist.txt

EXPOSE <PORT>

CMD opentracker -f /etc/opentracker/opentracker.conf