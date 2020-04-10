FROM elixir:1.10.1

RUN apt-get update && \
  apt-get install -y gnupg2 lsb-release && \
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
  echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |tee  /etc/apt/sources.list.d/pgdg.list && \
  apt-get update

RUN curl -sL https://deb.nodesource.com/setup_13.x | bash - && apt-get install -y inotify-tools nodejs postgis

WORKDIR /code/

RUN useradd -c 'phoenix user' -m -d /home/pho -s /bin/bash pho && \
    chown -R pho.pho /code && \
    chown -R pho.pho /usr/share/postgresql && \
    chown -R pho.pho /etc/alternatives/post*

USER pho

# install the Phoenix Mix archive
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install hex phx_new --force

ENV HOME /home/pho
