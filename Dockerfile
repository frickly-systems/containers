FROM zephyrprojectrtos/ci:latest

RUN apt-get update

COPY west-update-with-retry /usr/local/bin
RUN chmod +x /usr/local/bin/west-update-with-retry

RUN mkdir -p /workdir
WORKDIR /workdir
RUN chown -R user:user /workdir
USER user
# cmake package is registered under user: user (see zephyrprojectrtos/ci dockerfile)

# get newest revision. -> Only downgrades when user app specifies release
ARG ZEPHYR_VERSION main
RUN west init --mr ${ZEPHYR_VERSION} .

# prepoluate directories
RUN west-update-with-retry
# remove .west config, as we only need the directories such that they do not need to be downloaded again
RUN rm -rf .west
