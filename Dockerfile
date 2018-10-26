FROM elixir

# install Node.js (>= 8.0.0) and NPM in order to satisfy brunch.io dependencies # See https://hexdocs.pm/phoenix/installation.html#node-js-5-0-0
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y inotify-tools nodejs

WORKDIR /code

RUN useradd -c 'phoenix user' -m -d /home/pho -s /bin/bash pho && \
    chown -R pho.pho /code
USER pho

# install the Phoenix Mix archive
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez && \
    mix local.hex --force \
    && mix local.rebar --force

ENV HOME /home/pho