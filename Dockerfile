# Stage 1: Build stage
# Node 22+ required (utilium and current Flowise deps); Alpine needs
# python/make/g++ so better-sqlite3 can compile (no musl prebuilds).
FROM node:22-alpine AS build

USER root

ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV NODE_OPTIONS=--max-old-space-size=4096

RUN apk add --no-cache \
    python3 \
    make \
    g++ \
    build-base \
    libc6-compat

# Install latest Flowise globally (pin with flowise@x.y.z if needed)
RUN npm install -g flowise

# Stage 2: Runtime stage
FROM node:22-alpine

RUN apk add --no-cache \
    chromium \
    git \
    python3 \
    py3-pip \
    make \
    g++ \
    build-base \
    cairo-dev \
    pango-dev \
    curl \
    postgresql-client \
    libc6-compat

# Set the environment variable for Puppeteer to find Chromium
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
ENV NODE_OPTIONS=--max-old-space-size=4096

# Copy Flowise from the build stage
COPY --from=build /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=build /usr/local/bin /usr/local/bin

# Copy initialization script
COPY init-db.sh /init-db.sh
RUN chmod +x /init-db.sh

# Set environment variables
ENV PORT=80

# Expose the specified port
EXPOSE ${PORT}

# Use the initialization script as entrypoint
ENTRYPOINT ["/init-db.sh"]
