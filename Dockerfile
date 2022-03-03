FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
ENV WEB_DIR=/home

RUN apt-get update
RUN apt-get install -y --no-install-recommends ruby-full npm build-essential zlib1g-dev net-tools iputils-ping iproute2

RUN echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
RUN echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc

RUN npm install
RUN gem install jekyll bundler tzinfo

WORKDIR $WEB_DIR
