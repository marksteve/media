# Media Server

Jellyfin + QBittorrent

## Setup

1. Configure Cloudflare tunnel:

    1. `cloudflared tunnel create <TUNNEL_NAME>`
    2. Copy tunnel credentials inside `cloudflared/` and update `cloudflared/config.yml`

2. Configure environment variables in `setup.sh`

3. `sh setup.sh`