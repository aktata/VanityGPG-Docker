FROM rust:latest

RUN apt-get update && apt-get install -y \
    clang make pkg-config nettle-dev libssl-dev capnproto libsqlite3-dev

RUN cargo install vanity_gpg

WORKDIR /workspace

ENTRYPOINT ["vanity_gpg"]

