FROM ubuntu:16.04

MAINTAINER Andre Toledo Modesto de Souza <atoledo@ciandt.com>

RUN apt-get update #redo

# Install basic packages
RUN apt-get -y --no-install-recommends install \
  git zip unzip curl vim wget ssh rsync make

RUN apt-get -y --no-install-recommends install \
  python-pip

RUN curl -O https://bootstrap.pypa.io/get-pip.py

RUN python get-pip.py --user

ENV PATH="~/.local/bin:${PATH}"

RUN pip install awscli --upgrade --user

# Install Node through NVM
RUN apt-get -y --no-install-recommends install \
  libpng-dev build-essential

ENV NVM_DIR="$HOME/.nvm"
ENV NODE_VERSION=8.9.4

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash \
  && . $NVM_DIR/nvm.sh \
  && nvm install $NODE_VERSION \
  && nvm alias default $NODE_VERSION \
  && nvm use default \
  && npm rebuild node-sass

# Cleanup
RUN apt-get purge -y && \
  apt-get clean -y && \
  apt-get autoclean -y && \
  apt-get autoremove -y
