FROM elixir:slim

# install Node.js (>= 8.0.0) and NPM in order to satisfy brunch.io dependencies
# See https://hexdocs.pm/phoenix/installation.html#node-js-5-0-0
RUN apt-get update -y && \
    apt-get install -y curl git && \
    curl -sL https://deb.nodesource.com/setup_13.x | bash - && \
    apt-get install -y inotify-tools nodejs

WORKDIR /code

RUN useradd -c 'phoenix user' -m -d /home/pho -s /bin/bash pho && \
    chown -R pho.pho /code
USER pho

# install the Phoenix Mix archive
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install hex phx_new --force

ENV HOME /home/pho
