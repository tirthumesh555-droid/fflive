#!/usr/bin/env bash
set -e

# INPUT: pass file path or URL as first arg; default /app/song.mp3
INPUT="${1:-/app/song.mp3}"

if [ -z "$STREAM_KEY" ]; then
  echo "Error: STREAM_KEY not set (use fly secrets set STREAM_KEY=... )"
    exit 1
    fi

    echo "Starting stream with input: $INPUT"

    while true; do
      # audio-only loop (low CPU). Change if you want video+image.
        ffmpeg -re -stream_loop -1 -i "$INPUT" \
            -c:a aac -b:a 128k -ar 44100 -ac 2 \
                -f flv "rtmp://a.rtmp.youtube.com/live2/${STREAM_KEY}"
                  echo "ffmpeg exited. restarting in 3s..."
                    sleep 3
                    done
