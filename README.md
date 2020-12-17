# docker_netdata <a href='https://github.com/padhi-homelab/docker_netdata/actions?query=workflow%3A%22Docker+CI+Release%22'><img align='right' src='https://img.shields.io/github/workflow/status/padhi-homelab/docker_netdata/Docker%20CI%20Release?logo=github&logoWidth=24&style=flat-square'></img></a>

<a href='https://microbadger.com/images/padhihomelab/netdata'><img src='https://img.shields.io/microbadger/layers/padhihomelab/netdata/latest?logo=docker&logoWidth=24&style=for-the-badge'></img></a>
<a href='https://hub.docker.com/r/padhihomelab/netdata'><img src='https://img.shields.io/docker/image-size/padhihomelab/netdata/latest?label=size%20%5Blatest%5D&logo=docker&logoWidth=24&style=for-the-badge'></img></a>
<a href='https://hub.docker.com/r/padhihomelab/netdata'><img src='https://img.shields.io/docker/image-size/padhihomelab/netdata/testing?label=size%20%5Btesting%5D&logo=docker&logoWidth=24&style=for-the-badge'></img></a>

A multiarch [netdata] Docker image, based on [Alpine Linux].

|        386         |       amd64        |       arm/v6       |       arm/v7       |       arm64        |      ppc64le       |       s390x        |
| :----------------: | :----------------: | :----------------: | :----------------: | :----------------: | :----------------: | :----------------: |
| :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |


## Usage

```
docker run --rm --detach \
           -p 1234:1234 \
           -it padhihomelab/netdata
```

Runs `netdata` on port 1234.

_<More details to be added soon>_


---

### Inspired by
- <https://github.com/netdata/netdata>
- <https://github.com/netdata/helper-images>



[Alpine Linux]: https://alpinelinux.org/
[netdata]:      https://www.netdata.cloud/
