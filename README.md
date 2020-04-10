# phoenix_docker_compose

Phoenix framework with postgres and postgis.

Usage

    docker-compose up -d
    docker-compose exec dev bash
    mix phx.new new_project
    in new_project/config/dev.exs replace hostname: "localhost" to hostname: "db",
    cd new_project && mix ecto.create && mix phx.server
