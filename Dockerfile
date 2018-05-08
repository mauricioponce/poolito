FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y build-essential libtool autotools-dev autoconf pkg-config libssl-dev
RUN apt-get install -y libboost-all-dev git npm nodejs libminiupnpc-dev wget

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get install -y libdb4.8-dev libdb4.8++-dev

RUN wget https://nodejs.org/dist/v0.10.25/node-v0.10.25.tar.gz && \
   tar xfz node-v0.10.25.tar.gz

RUN apt-get install -y gcc

RUN cd node-v0.10.25 && \
   make && \
   make install

RUN cd / && \
    git clone https://github.com/zone117x/node-cryptonote-pool.git pool && \
    cd pool && \
    npm set registry http://r.cnpmjs.org/ && \
    npm config set strict-ssl false && \
    npm update

WORKDIR /pool
