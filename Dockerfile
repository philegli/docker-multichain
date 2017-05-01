FROM debian:latest

# Install pre-reqs
RUN  apt-get update && \
     apt-get install -y wget && \
     rm -rf /var/lib/apt/lists/*

ENV NETWORK_PORT 8571
ENV RPC_PORT     8570
ENV CHAIN_NAME   private_chain  

WORKDIR /tmp
# Download the multichain binaries, extract and move them to the relevant directory and remove the tmp files.
RUN wget http://www.multichain.com/download/multichain-1.0-beta-1.tar.gz && \
    tar -xvzf multichain-1.0-beta-1.tar.gz && \
    cd multichain-1.0-beta-1 && \
    mv multichaind multichain-cli multichain-util /usr/local/bin && \
    rm -rf /tmp/*

WORKDIR /root
RUN echo "multichain-util create \$CHAIN_NAME -default-network-port=\$NETWORK_PORT -default-rpc-port=\$RPC_PORT" > createAndRunChain.sh && \
    echo "multichaind \$CHAIN_NAME" >> createAndRunChain.sh && \
    chmod +x createAndRunChain.sh

CMD "/root/createAndRunChain.sh"

EXPOSE $NETWORK_PORT
EXPOSE $RPC_PORT
