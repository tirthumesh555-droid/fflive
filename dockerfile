FROM debianNstable-t up
  ENV DEBIAN_FRONTEND=noninteractive
  RUN apt-get update && apt-get install -y \
      ffmpeg \
      curl \
      ca-certificates \
    && rm -rf /var/lib/apt/lists/*

    WORKDIR /app
    COPY start.sh /app/start.sh
    RUN chmod +x /app/start.sh

    # If you want to include a local song, uncomment:
    # COPY song.mp3 /app/song.mp3

    CMD ["/app/start.sh"]
