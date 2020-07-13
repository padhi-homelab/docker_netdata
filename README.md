# docker_netdata <a href='https://github.com/padhi-homelab/docker_netdata/actions?query=workflow%3A%22Docker+CI+Release%22'><img align='right' src='https://img.shields.io/github/workflow/status/padhi-homelab/docker_netdata/Docker%20CI%20Release?logo=github&logoWidth=24&style=flat-square'></img></a>

<a href='https://hub.docker.com/r/padhihomelab/netdata'><img src='https://img.shields.io/docker/image-size/padhihomelab/netdata/latest?logo=docker&logoWidth=24&style=for-the-badge'></img></a> <a href='https://microbadger.com/images/padhihomelab/netdata'><img src='https://img.shields.io/microbadger/layers/padhihomelab/netdata/latest?logo=docker&logoWidth=24&style=for-the-badge'></img></a>

A multiarch [netdata] Docker image, based on [Alpine Linux].

<table>
  <thead>
    <tr>
      <th>:heavy_check_mark: i386</th>
      <th>:heavy_check_mark: amd64</th>
      <th>:heavy_check_mark: arm</th>
      <th>:heavy_check_mark: armhf</th>
      <th>:heavy_check_mark: aarch64</th>
      <th>:heavy_check_mark: ppc64le</th>
    <tr>
  </thead>
</table>

### Credits

#### https://github.com/netdata/netdata
  - My [Dockerfile](Dockerfile) is largely based on
    the [official files](https://github.com/netdata/netdata/tree/master/packaging/docker).
  - I disabled cloud integration (`--disable-cloud`),
    and disabled telemetry (`--disable-telemetry`).

#### https://github.com/netdata/helper-images
  - My [builder](builder.Dockerfile) and [runtime](runtime.Dockerfile)
    images are based on the [builder](https://github.com/netdata/helper-images/blob/master/builder/Dockerfile)
    and [base](https://github.com/netdata/helper-images/blob/master/base/Dockerfile) images in this repo.
  - I removed `freeipmi` since I do not need it.
  - I removed [MySQL] and [PostgreSQL] from runtime,
    but added support for [MongoDB] + [protobuf] + [snappy].



[Alpine Linux]: https://alpinelinux.org/
[MongoDB]:      https://www.mongodb.com/
[MySQL]:        https://www.mysql.com/
[netdata]:      https://www.netdata.cloud/
[PostgreSQL]:   https://www.postgresql.org/
[protobuf]:     https://github.com/protocolbuffers/protobuf/
[snappy]:       https://github.com/google/snappy/
