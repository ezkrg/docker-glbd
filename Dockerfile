ARG GLB_VERSION=master

FROM debian:bullseye-slim AS builder

RUN apt-get update \
 && apt-get install -y git-core libtool autoconf automake g++ make \
 && cd /tmp \
 && git clone -n https://github.com/codership/glb \
 && cd glb \
 && git checkout ${GLB_VERSION} \
 && ./bootstrap.sh \
 && ./configure \
 && make \
 && make install

FROM debian:bullseye-slim AS glbd

COPY --from=builder /usr/local/sbin/glbd /usr/local/sbin/glbd

ENTRYPOINT [ "/usr/local/sbin/glbd" ]
CMD [ "--help" ]
