#!/bin/sh
sudo rm -r /mnt/stateful_partition/cloudflared
sudo mv /tmp/cloudflared /mnt/stateful_partition/cloudflared
sudo chown -R root:root /mnt/stateful_partition/cloudflared
docker rm -f cloudflared
docker run -d \
  --name cloudflared \
  --network host \
  -p 80:80 \
  -p 443:443 \
  -v /mnt/stateful_partition/cloudflared:/etc/cloudflared \
  cloudflare/cloudflared:2021.7.0 \
  tunnel --config /etc/cloudflared/config.yml run
