FROM debian:10
ENV APPIMAGEFILE=""
ENV PUBKEYASC=""
RUN apt-get update && apt-get upgrade -y && apt-get install -y nano gnupg2 git pkg-config build-essential wget make binutils fuse libarchive-dev libfuse-dev zlib1g-dev patch openssl libssl-dev automake cmake autoconf libtool vim-common desktop-file-utils bash glib2.0 libcairo2-dev

COPY validateappimage.sh /
RUN chmod +x /validateappimage.sh
RUN git clone --recursive https://github.com/yobson/AppImageKit --depth=1 /tmp/AppImageKit
WORKDIR /tmp/AppImageKit
RUN cmake . -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_BUILD_TYPE=Release
RUN make -j`nproc`
RUN make install
RUN rm -rf /tmp/AppImageKit
WORKDIR /

CMD ["bin/bash", "validateappimage.sh"]
