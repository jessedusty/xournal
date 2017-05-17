FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y git
WORKDIR /root
RUN apt-get install -y autoconf automake libgtk2.0-dev libgnomecanvas2-dev libpoppler-glib8 libpoppler-glib-dev ghostscript
COPY . /root/xournal
WORKDIR /root/xournal
RUN ./autogen.sh
RUN make
RUN make install
RUN make desktop-install
ENTRYPOINT xournal
