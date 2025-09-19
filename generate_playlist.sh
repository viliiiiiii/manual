#!/usr/bin/env bash
set -euo pipefail
MUSIC_DIR="music"
PLAYLIST="site/playlist.m3u"

shopt -s nullglob
files=( "$MUSIC_DIR"/*.{mp3,m4a,aac,ogg,wav,flac} )
shopt -u nullglob

echo "#EXTM3U" > "$PLAYLIST"
if [ ${#files[@]} -eq 0 ]; then
  echo "# No audio files found in $MUSIC_DIR" >> "$PLAYLIST"
  echo "No audio files found in $MUSIC_DIR"
  exit 0
fi

for f in "${files[@]}"; do
  base="$(basename "$f")"
  # Optional: add a simple EXTINF line with the file name (without extension)
  name="${base%.*}"
  echo "#EXTINF:-1,$name" >> "$PLAYLIST"
  echo "/music/$base" >> "$PLAYLIST"
done

echo "Wrote playlist with ${#files[@]} tracks to $PLAYLIST"
