# Minimal Dockerfile for the "Docker Layer Caching & GHCR" lab.

FROM ubuntu:22.04

# Rarely changes -> should show as CACHED on repeat runs
RUN apt-get update && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Changes most often -> rebuilt whenever README.md changes
COPY README.md .

RUN ls
CMD ["cat", "/app/README.md"]
