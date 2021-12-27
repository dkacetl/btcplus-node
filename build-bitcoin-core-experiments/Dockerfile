FROM ubuntu:20.04 AS build
LABEL maintainer="dkacetl (dkacetl@gmail.com)"
ARG TAG=v22.0

# Install all dependencies for build. TimeZone must be set for apt
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt-get update -y \
    && apt-get install -y curl gnupg gosu git wget \
       zip build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 \
       libevent-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-test-dev \
       libsqlite3-dev libminiupnpc-dev libnatpmp-dev libzmq3-dev systemtap-sdt-dev libminiupnpc-dev libnatpmp-dev \
       systemtap-sdt-dev g++-arm-linux-gnueabihf \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# clone source code of bitcoin-core
RUN git clone https://github.com/bitcoin/bitcoin.git \
    && cd bitcoin \
    && git checkout tags/${TAG} -b ${TAG}-branch

# For build including wallet, Berkley DB must be built and installed
RUN cd bitcoin/contrib && bash ./install_db4.sh .

# Lets build it
RUN cd bitcoin \
  && ./autogen.sh \
  && export BDB_PREFIX='/bitcoin/contrib/db4' \
  && ./configure \
    --enable-reduce-exports \
    --with-zmq \
    --without-gui \
    --disable-tests \
    --disable-bench \
    --disable-ccache \
    --with-utils \
    --with-libs \
    --with-daemon \
    LDFLAGS=-static-libstdc++ \
    BDB_LIBS="-L${BDB_PREFIX}/lib -ldb_cxx-4.8" \
    BDB_CFLAGS="-I${BDB_PREFIX}/include" \
    CXXFLAGS="--param ggc-min-expand=1 --param ggc-min-heapsize=32768" \
  && make -j4

RUN cd bitcoin && make install
RUN chmod +x /bitcoin/src/bitcoind

EXPOSE 8332 8333 18332 18333 18443 18444 38333 38332

COPY ./docker-entrypoint.sh /root/docker-entrypoint.sh
RUN chmod +x /root/docker-entrypoint.sh
ENTRYPOINT ["/root/docker-entrypoint.sh"]
CMD ["/bitcoin/src/bitcoind"]
