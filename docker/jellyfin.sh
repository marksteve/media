#!/bin/sh
docker rm -f jellyfin
docker run -d \
  --name=jellyfin \
  --network host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Manila \
  -p 8096:8096 \
  -v /mnt/stateful_partition/jellyfin/library:/config \
  -v /mnt/stateful_partition/qbittorrent/downloads:/downloads \
  --restart unless-stopped \
  ghcr.io/linuxserver/jellyfin
