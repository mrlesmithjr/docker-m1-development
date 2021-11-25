# docker-m1-development

Just a little repo I am putting together as I transition to using an Apple M1 Pro for
development, etc. For now, my intent is to make a switch to a [VSCode Development Container](https://code.visualstudio.com/docs/remote/containers).

> NOTE: This will also work on non-Apple M1

## Docker Images

By default, I am using my own personal [Dockerfiles](https://github.com/mrlesmithjr/dockerfiles)
to build from.

## Docker Hub

You can consume this image from Docker hub as `mrlesmithjr/docker-m1-development`.

## Docker Management

The Docker CLI utils are installed within the container and `/var/run/docker.sock` is
mounted from the host into the container. This allows us to manage Docker on the host.
This functionality is also configued to not require `sudo`.

```bash
❯ docker ps
CONTAINER ID   IMAGE                                                        COMMAND                  CREATED         STATUS         PORTS     NAMES
2a8790ac3739   vsc-docker-m1-development-a43f11da8205683013f00548b1727037   "/bin/sh -c 'echo Co…"   5 minutes ago   Up 5 minutes             nice_meninsky
❯ docker images
REPOSITORY                                                   TAG       IMAGE ID       CREATED             SIZE
vsc-docker-m1-development-a43f11da8205683013f00548b1727037   latest    ceb1f3a42beb   6 minutes ago       1.02GB
<none>                                                       <none>    0f0317605b5e   12 minutes ago      1.02GB
<none>                                                       <none>    8b35f448fe20   32 minutes ago      1.02GB
<none>                                                       <none>    43d541e4de65   38 minutes ago      1.02GB
<none>                                                       <none>    980ae74f880b   About an hour ago   861MB
<none>                                                       <none>    c556b0a7ca3f   2 hours ago         861MB
<none>                                                       <none>    e50080efa24f   4 hours ago         861MB
<none>                                                       <none>    ad1cdd236413   4 hours ago         427MB
  /workspaces/docker-m1-development on   main ❯                                                                                                       at  22:46:04
```

## Usage

## Licensing

The current licensing model is MIT by default.

## Author Information

Larry Smith Jr.

- [@mrlesmithjr](https://twitter.com/mrlesmithjr)
- [EverythingShouldBeVirtual](http://everythingshouldbevirtual.com)
- [mrlesmithjr@gmail.com](mailto:mrlesmithjr@gmail.com)
