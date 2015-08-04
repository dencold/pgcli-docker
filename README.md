# pgcli-docker
Dockerized version of the [pgcli](http://pgcli.com/) tool for postgres. 

## Why a docker version?

I generally run my development apps with a separate container for the postgres database. Hooking up the database to the application is achieved via docker [links](https://docs.docker.com/userguide/dockerlinks/). In order to make it easy to use `pgcli` on any postgres container, I've made a simple docker wrapper for the command. It is smart about pulling in the linked postgres environment variables and makes it dead-easy to use on your own instances.

## Installing

Installing happings via a simple docker pull:

`docker pull dencold/pgcli`

## Running

If you have a postgres container already running, all you need to do is run pgcli with a link setup. For example, if your postgres container was named `my-postgres`, you can attach pgcli with this one-liner:

```docker run -it --link my-postgres:postgres --rm dencold/pgcli```

You'll get a prompt for password, once authenticated you'll be in a pgcli session. When you exit, the container will automatically be cleaned up.

## TODOs
