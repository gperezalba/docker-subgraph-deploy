FROM node:16.14.0
RUN mkdir subgraphs
WORKDIR /subgraphs
ARG USER
ENV USER=${USER}
ARG PAT
ENV PAT=${PAT}
ARG ORG
ENV ORG=${ORG}
ARG NAME
ENV NAME=${NAME}
ARG GRAPH_NODE
ENV GRAPH_NODE=${GRAPH_NODE}
ARG IPFS
ENV IPFS=${IPFS}
RUN git clone https://${USER}:${PAT}@github.com/${ORG}/${NAME}
WORKDIR /subgraphs/${NAME}
RUN yarn && yarn codegen
RUN npx graph create --node ${GRAPH_NODE} ${ORG}/${NAME}
RUN npx graph deploy --node ${GRAPH_NODE} --ipfs ${IPFS} ${ORG}/${NAME}