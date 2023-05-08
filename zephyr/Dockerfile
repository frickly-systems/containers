FROM zephyrprojectrtos/ci:latest
ARG REPOSITORY_URL="https://github.com/zephyrproject-rtos/zephyr"

RUN apt-get update && apt-get install -y \
  curl \
  tree

COPY west-update-with-retry /usr/local/bin
RUN chmod +x /usr/local/bin/west-update-with-retry

RUN mkdir -p /workdir
WORKDIR /workdir
RUN chown -R user:user /workdir
USER user
# cmake package is registered under user: user (see zephyrprojectrtos/ci dockerfile)

# install rust under user
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# Pull from main to get latest updates
RUN west init -m $REPOSITORY_URL --mr main

# prepoluate directories
RUN west-update-with-retry

COPY install-python-dependencies /usr/local/bin
RUN install-python-dependencies

# remove .west config, as we only need the directories such that they do not need to be downloaded again
RUN rm -rf .west
