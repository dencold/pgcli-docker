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

It will determine host, port, and login details directly from the linked postgres container's environment variables. You should be dropped right into a pgcli session without the need to type in any credentials. Awesomesauce!

### Version Notes

In order to guarantee stability, the version for pgcli is pinned in the Dockerfile. The maintainers (currently just @dencold) will work to keep this updated and make sure that things don't break between releases. Both the Docker image on the hub, as well as the git repository will be tagged with the version information and will match what we are pulling from pgcli.

Current version of the repository is **0.19.2**.

## TODOs

* We currently rely on environment variables such as POSTGRES_ENV_POSTGRES_PASSWORD in order to log the user into the postgres session. We should have some detection built into the script when the variables aren't set and provide some helpful feedback to the caller.  

* Update `run_pgcli.sh` to also run with raw arguments instead of just relying on docker link.
