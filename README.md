# docker-m1-development

Just a little repo I am putting together as I transition to using an Apple M1 Pro for
development, etc. For now, my intent is to make a switch to a [VSCode Development Container](https://code.visualstudio.com/docs/remote/containers).

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

### Docker Image(s)

The default image defined in [.devcontainer/devcontainer.json](.devcontainer/devcontainer.json)
is `mrlesmithjr/docker-m1-development:arm64` but, you can also change this to `mrlesmithjr/docker-m1-development:amd64` for `X86` environments. The intent is for developing on Apple
M1, but you have flexibility based on your needs.

### Additional Configs

You can find pre-defined scripts in [config/](config/) for installing additional tools,
etc. These are meant to not be included in the default base image and only used if
desired.

### Mounts

Some pre-defined mounts are added to [.devcontainer/devcontainer.json](.devcontainer/devcontainer.json)
but, you can modify these as needed. The defaults are likely not present on your
computer which will cause errors, but you can add these in your home directory or remove
them from the config.

## Build Source

You can find the build source for this [here](https://github.com/mrlesmithjr/docker-m1-development-src).

## Licensing

The current licensing model is MIT by default.

## Author Information

Larry Smith Jr.

- [@mrlesmithjr](https://twitter.com/mrlesmithjr)
- [EverythingShouldBeVirtual](http://everythingshouldbevirtual.com)
- [mrlesmithjr@gmail.com](mailto:mrlesmithjr@gmail.com)
