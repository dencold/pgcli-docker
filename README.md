# pgcli-docker
Dockerized version of the [pgcli](http://pgcli.com/) tool for postgres. 

### Why a docker version?

I generally run my development apps with a separate container for the postgres database. Hooking up the database to the application is achieved via docker [links](https://docs.docker.com/userguide/dockerlinks/). In order to make it easy to use `pgcli` on any postgres container, I've made a simple docker wrapper for the command. It is smart about pulling in the linked postgres environment variables and makes it easy to use on your own instances.

### Installing

Installing is a simple docker pull away:

`docker pull dencold/pgcli`

### Running

If you have a postgres container already running, all you need to do is link the postgres container to pgcli. For example, if your postgres container was named `my-postgres`, you can attach pgcli with this one-liner:

```docker run -it --link my-postgres:postgres --rm dencold/pgcli```

You'll get a prompt for password, once authenticated you'll be in a pgcli session. When you exit, the container will automatically be cleaned up.

### Version Notes

In order to guarantee stability, the version for pgcli is pinned in the Dockerfile. The maintainers (currently just @dencold) will work to keep this updated and make sure that things don't break between releases. Both the Docker image on the hub, as well as the git repository will be tagged with the version information and will match what we are pulling from pgcli.

Current version of the repository is **0.19.2**.

## TODOs

* See if we can reference the `POSTGRES_ENV_POSTGRES_PASSWORD` variable in as an argument to pgcli, this would allow for automatic connection to the instance. Looks like from usage there isn't a password option:
```
$ pgcli --help
Usage: pgcli [OPTIONS] DATABASE

Options:
  -h, --host TEXT     Host address of the postgres database.
  -p, --port INTEGER  Port number at which the postgres instance is listening.
  -U, --user TEXT     User name to connect to the postgres database.
  -W, --password      Force password prompt.
  --help              Show this message and exit.
```

**BUT** there is the ability to pass a dburl: 

```
$ pgcli postgres://amjith:passw0rd@example.com:5432/app_db
```
We'll try to go that route.

* Update `run_pgcli.sh` to also run with raw arguments instead of just relying on docker link.
