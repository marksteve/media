#!/bin/sh
docker rm -f qbittorrent
docker run -d \
  --name=qbittorrent \
  --network host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Manila \
  -e WEBUI_PORT=8080 \
  -p 6881:6881 \
  -p 6881:6881/udp \
  -p 8080:8080 \
  -v /mnt/stateful_partition/qbittorrent/config:/config \
  -v /mnt/stateful_partition/qbittorrent/downloads:/downloads \
  --restart unless-stopped \
  ghcr.io/linuxserver/qbittorrent
