FROM rust:slim-bookworm AS base
ARG REPOSITORY_URL="https://github.com/zephyrproject-rtos/zephyr"

RUN apt-get update && apt-get install -y \
  tree \
  cmake

RUN cargo install convco
RUN mv $(which convco) /convco

FROM ubuntu:latest
COPY --from=base /convco /usr/bin/convco
RUN apt-get update && apt-get install -y \
  git \
  git-lfs
