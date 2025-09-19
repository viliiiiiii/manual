# Music Playlist Server (Docker)

A tiny Dockerized Nginx server for hosting a folder of songs and a playlist file.
Open the playlist URL in a player (e.g., VLC) and it will play the tracks.

## Quick start

1) Put your songs (mp3/m4a/aac/ogg/wav/flac) into the `music/` folder.

2) Generate the playlist:
```bash
./generate_playlist.sh
```

3) Build and run:
```bash
docker compose up -d --build
```

4) Open one of:
- Playlist: http://localhost:8080/playlist.m3u
- File browser: http://localhost:8080/music/
- Simple web player: http://localhost:8080/

## Notes
- Nginx is configured to serve `.m3u`/`.m3u8` with `audio/x-mpegurl`.
- The container exposes port `8080` (mapped to host 8080).
- Volumes map `./site` and `./music` so you can edit without rebuilds.
- Re-run `./generate_playlist.sh` whenever you add/remove songs.

## Custom Domain / Remote Server
If you deploy to a VPS, adjust the port mapping (e.g. "80:8080") in `docker-compose.yml`,
or put this service behind a reverse proxy like Caddy or Nginx Proxy Manager with HTTPS.
