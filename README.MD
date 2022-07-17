<!-- ### -->

```
docker run -d \
  --name=sonarr \
  -e PUID=99 \
  -e PGID=100 \
  -e TZ=UTC \ #optional
  -e UMASK=022 \  #optional
  -p <hostport>:8989 \
  -v <hostconfigpath>:/config \
  -v <hostmediapath>:/data \ #optional
  --restart unless-stopped \  #optional
  ghcr.io/agpsn/alpine-sonarr:latest
